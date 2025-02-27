import argparse
import pickle

import neuralogic

if not neuralogic.is_initialized():
    neuralogic.initialize(jar_path="../jar/NeuraLogic.jar", debug_mode=False)  # custom momentary backend upgrades

from neuralogic.core import R
from neuralogic.dataset import Dataset, Sample

from modelling.samples import parse_domain
from modelling.templates import build_template
from modelling.training import train

from modelling.planning import State, parse_pddl_actions


def load_model(save_file, model=None):
    """This serialization will be done more correctly as a function in the next release of neuralogic..."""

    with open(save_file + "_weights", 'rb') as f:
        # weights = torch.load(f)
        weights = pickle.load(f)

    if model is None:
        with open(save_file + "_template", 'rb') as f:
            template = pickle.load(f)
        model = build_template(template)
    else:
        template = None

    model.load_state_dict(weights)
    return model, template


def get_domain_setup(domain_name):
    """get some adhoc init state from the jsons, without the labeled queries"""
    problems, predicates, actions = parse_domain(domain_name, problem_limit=1)
    actions = parse_pddl_actions(domain_name)
    for states, goal_state in problems.values():
        for state in states:
            break
        break
    init_state = State(state)
    init_state.setup_ILG(goal_state)
    goal_state = State(goal_state)
    return init_state, actions, goal_state


def test_model(domain_name, model_file, model=None, steps=100):
    """Test a stored/trained model/template on a given domain"""
    init_state, actions, goal_state = get_domain_setup(domain_name)
    print(f'init_state: {init_state.atoms}')
    actions = {action.name: action for action in actions}

    if model is None:
        if model_file:
            model, template = load_model(model_file)
        else:
            model, template = train(domain_name, numeric=False, save_file="./target/tmp", plotting=True)
    model.test()

    for i in range(steps):
        init_state = policy_step(model, init_state, actions)
        init_state.setup_ILG(goal_state.atoms)
        if init_state.is_goal(goal_state.atoms):
            print(f"Goal state found: {init_state.atoms}")
            break


def policy_step(model, init_state, actions):
    sorted_actions = score_output_actions(actions, init_state, model)
    # sorted_actions = score_blind_actions(actions, init_state, model)  # switch here for a possibly faster version

    print(f'applicable: {sorted_actions}')

    best_action = sorted_actions[0]
    split = best_action[0].split("(")
    action_name = split[0]
    action_terms = split[1][:-1]
    action = actions[action_name]
    print(f'selecting: {best_action}')

    # todo perhaps skip the backend and simply do the successor in python? For already ground actions it's not a big difference...
    ground_action = action.ground(action_terms)
    next_state = ground_action.successor(init_state.backend())
    print(f'next_state: {next_state}')

    successor = State.from_backend(next_state)
    return successor


def score_output_actions(actions, init_state, model):
    """The core step where the model get evaluated, and we check the values of the queries corresponding to actions"""
    # TODO(DZC): action_queries: list[str] of lifted actions, init_state: list[str] with prefixes
    dataset = Dataset()
    dataset.add_example(init_state.get_relations())
    dataset.add_queries([action.query for name, action in actions.items()])
    ground_samples = model.ground(dataset)

    indexed_state = State.from_grounding(ground_samples[0])  # optionally also stored the efficient backend structure

    bd = model.build_dataset(ground_samples)  # todo skip pre/postprocessing here for speedup

    scored_actions = [output_neuron_values(sample, model) for sample in bd]

    return sorted(scored_actions, key=lambda item: item[1], reverse=True)


def output_neuron_values(sample, model):
    output_name = str(sample.java_sample.query.neuron.name)
    output_value = model(sample)
    return output_name, output_value


def score_blind_actions(actions, init_state, model):
    """This will evaluate the actions by directly reading out neuron values from the single network (experimental)"""
    model.settings['neuralNetsPostProcessing'] = False  # for speedup
    model.settings.chain_pruning = False
    model.settings.iso_value_compression = False
    dataset = Dataset()
    dataset.add_sample(Sample(query=None, example=init_state.get_relations()))
    bd = model.build_dataset(dataset)
    scored_actions = inner_neuron_values(bd[0], actions)
    return sorted(scored_actions, key=lambda item: item[1], reverse=True)


def inner_neuron_values(sample, actions):
    """this can be used to query values of the actions even if they are not the outputs, e.g. in the regression setting"""
    scored_actions = []
    for action_name, action in actions.items():
        atoms = sample.get_atom(action.query)
        if atoms:
            for a in atoms:
                scored_actions.append((str(a._atom.name), a.value, action_name, a.substitutions))
    return scored_actions


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", "--domain", type=str, default="blocksworld", choices=["satellite", "blocksworld"])
    parser.add_argument("--save_file", type=str, default='./target/stored_model')
    args = parser.parse_args()
    domain_name = args.domain
    saved_file = args.save_file + f'_{domain_name}'
    print(f"{domain_name=}")
    print(f"{saved_file=}")

    test_model(domain_name, saved_file)  # test an already trained, stored model
    # test_model(domain_name, None)    # train model first and then test
