
(define (problem transport-09)
 (:domain transport)
 (:objects 
    v1 - vehicle
    p1 p2 p3 p4 p5 - package
    l1 l2 l3 l4 l5 l6 l7 - location
    c0 c1 c2 - size
    )
 (:init
    (capacity v1 c1)
    (capacity-predecessor c0 c1)
    (capacity-predecessor c1 c2)
    (at p1 l3)
    (at p2 l4)
    (at p3 l5)
    (at p4 l6)
    (at p5 l7)
    (at v1 l3)
    (road l6 l2)
    (road l3 l4)
    (road l2 l7)
    (road l4 l3)
    (road l3 l1)
    (road l2 l3)
    (road l2 l6)
    (road l7 l2)
    (road l5 l3)
    (road l3 l2)
    (road l1 l3)
    (road l3 l5)
    (road l2 l4)
    (road l4 l2)
    )
 (:goal  (and 
    (at p1 l4)
    (at p2 l2)
    (at p3 l1)
    (at p4 l1)
    (at p5 l2))))
