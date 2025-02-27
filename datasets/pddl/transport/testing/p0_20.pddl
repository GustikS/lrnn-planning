
(define (problem transport-20)
 (:domain transport)
 (:objects 
    v1 - vehicle
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 - package
    l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 - location
    c0 c1 c2 - size
    )
 (:init
    (capacity v1 c1)
    (capacity-predecessor c0 c1)
    (capacity-predecessor c1 c2)
    (at p1 l4)
    (at p2 l10)
    (at p3 l7)
    (at p4 l8)
    (at p5 l9)
    (at p6 l6)
    (at p7 l9)
    (at p8 l9)
    (at p9 l2)
    (at p10 l2)
    (at v1 l8)
    (road l3 l7)
    (road l2 l8)
    (road l7 l1)
    (road l6 l5)
    (road l6 l11)
    (road l5 l6)
    (road l4 l8)
    (road l8 l2)
    (road l9 l7)
    (road l10 l8)
    (road l7 l3)
    (road l7 l9)
    (road l3 l2)
    (road l3 l11)
    (road l8 l4)
    (road l11 l3)
    (road l8 l10)
    (road l11 l6)
    (road l2 l3)
    (road l1 l7)
    (road l4 l6)
    (road l6 l4)
    (road l1 l9)
    (road l9 l1)
    (road l4 l10)
    (road l10 l4)
    (road l1 l10)
    (road l10 l1)
    (road l2 l11)
    (road l11 l2)
    (road l5 l7)
    (road l7 l5)
    (road l9 l10)
    (road l10 l9)
    (road l3 l9)
    (road l9 l3)
    (road l2 l5)
    (road l5 l2)
    (road l2 l4)
    (road l4 l2)
    (road l3 l10)
    (road l10 l3)
    (road l4 l11)
    (road l11 l4)
    (road l1 l11)
    (road l11 l1)
    (road l7 l8)
    (road l8 l7)
    (road l9 l11)
    (road l11 l9)
    (road l3 l4)
    (road l4 l3)
    (road l5 l11)
    (road l11 l5)
    (road l1 l4)
    (road l4 l1)
    (road l6 l9)
    (road l9 l6)
    (road l2 l10)
    (road l10 l2)
    (road l8 l9)
    (road l9 l8)
    )
 (:goal  (and 
    (at p1 l2)
    (at p2 l1)
    (at p3 l5)
    (at p4 l10)
    (at p5 l3)
    (at p6 l10)
    (at p7 l1)
    (at p8 l5)
    (at p9 l8)
    (at p10 l11))))
