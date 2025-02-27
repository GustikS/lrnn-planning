
(define (problem transport-12)
 (:domain transport)
 (:objects 
    v1 - vehicle
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 - package
    l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 l12 l13 l14 l15 l16 l17 l18 l19 l20 l21 l22 l23 l24 l25 l26 l27 - location
    c0 c1 c2 c3 c4 - size
    )
 (:init
    (capacity v1 c4)
    (capacity-predecessor c0 c1)
    (capacity-predecessor c1 c2)
    (capacity-predecessor c2 c3)
    (capacity-predecessor c3 c4)
    (at p1 l2)
    (at p2 l19)
    (at p3 l14)
    (at p4 l5)
    (at p5 l20)
    (at p6 l20)
    (at p7 l13)
    (at p8 l12)
    (at p9 l4)
    (at p10 l7)
    (at p11 l2)
    (at p12 l11)
    (at p13 l20)
    (at p14 l11)
    (at p15 l16)
    (at p16 l16)
    (at p17 l9)
    (at p18 l1)
    (at p19 l12)
    (at p20 l27)
    (at v1 l5)
    (road l4 l9)
    (road l20 l17)
    (road l23 l16)
    (road l6 l27)
    (road l17 l9)
    (road l21 l25)
    (road l9 l14)
    (road l10 l9)
    (road l9 l17)
    (road l19 l15)
    (road l1 l9)
    (road l2 l8)
    (road l15 l5)
    (road l9 l23)
    (road l2 l20)
    (road l20 l2)
    (road l18 l13)
    (road l12 l3)
    (road l23 l9)
    (road l14 l9)
    (road l18 l25)
    (road l27 l6)
    (road l3 l12)
    (road l27 l3)
    (road l8 l2)
    (road l9 l1)
    (road l3 l15)
    (road l12 l24)
    (road l9 l4)
    (road l9 l10)
    (road l5 l15)
    (road l11 l7)
    (road l17 l20)
    (road l3 l27)
    (road l13 l18)
    (road l25 l21)
    (road l18 l9)
    (road l25 l18)
    (road l11 l25)
    (road l15 l19)
    (road l18 l15)
    (road l15 l22)
    (road l22 l15)
    (road l12 l26)
    (road l7 l11)
    (road l9 l18)
    (road l15 l3)
    (road l24 l12)
    (road l25 l11)
    (road l26 l12)
    (road l15 l18)
    (road l16 l23)
    (road l7 l23)
    (road l23 l7)
    (road l2 l14)
    (road l14 l2)
    (road l13 l16)
    (road l16 l13)
    (road l5 l22)
    (road l22 l5)
    (road l3 l16)
    (road l16 l3)
    (road l16 l22)
    (road l22 l16)
    (road l15 l17)
    (road l17 l15)
    (road l22 l23)
    (road l23 l22)
    (road l2 l22)
    (road l22 l2)
    (road l5 l6)
    (road l6 l5)
    (road l1 l13)
    (road l13 l1)
    (road l5 l16)
    (road l16 l5)
    (road l8 l27)
    (road l27 l8)
    (road l16 l27)
    (road l27 l16)
    (road l12 l13)
    (road l13 l12)
    (road l10 l16)
    (road l16 l10)
    (road l14 l16)
    (road l16 l14)
    (road l9 l26)
    (road l26 l9)
    (road l8 l16)
    (road l16 l8)
    (road l6 l10)
    (road l10 l6)
    (road l20 l24)
    (road l24 l20)
    (road l19 l21)
    (road l21 l19)
    (road l13 l19)
    (road l19 l13)
    (road l3 l23)
    (road l23 l3)
    (road l5 l18)
    (road l18 l5)
    (road l3 l20)
    (road l20 l3)
    (road l8 l13)
    (road l13 l8)
    (road l12 l17)
    (road l17 l12)
    (road l18 l24)
    (road l24 l18)
    (road l8 l23)
    (road l23 l8)
    (road l7 l26)
    (road l26 l7)
    (road l8 l24)
    (road l24 l8)
    (road l5 l8)
    (road l8 l5)
    (road l20 l22)
    (road l22 l20)
    (road l6 l11)
    (road l11 l6)
    (road l8 l10)
    (road l10 l8)
    (road l2 l18)
    (road l18 l2)
    (road l6 l14)
    (road l14 l6)
    (road l19 l24)
    (road l24 l19)
    (road l3 l4)
    (road l4 l3)
    (road l5 l12)
    (road l12 l5)
    (road l11 l17)
    (road l17 l11)
    (road l1 l21)
    (road l21 l1)
    (road l1 l5)
    (road l5 l1)
    (road l10 l12)
    (road l12 l10)
    (road l18 l27)
    (road l27 l18)
    (road l1 l10)
    (road l10 l1)
    (road l13 l26)
    (road l26 l13)
    (road l5 l11)
    (road l11 l5)
    (road l2 l21)
    (road l21 l2)
    (road l19 l20)
    (road l20 l19)
    (road l18 l23)
    (road l23 l18)
    (road l4 l22)
    (road l22 l4)
    (road l19 l27)
    (road l27 l19)
    (road l16 l17)
    (road l17 l16)
    (road l19 l26)
    (road l26 l19)
    (road l6 l26)
    (road l26 l6)
    (road l15 l20)
    (road l20 l15)
    (road l4 l24)
    (road l24 l4)
    (road l6 l7)
    (road l7 l6)
    (road l14 l21)
    (road l21 l14)
    (road l21 l23)
    (road l23 l21)
    (road l1 l16)
    (road l16 l1)
    (road l9 l20)
    (road l20 l9)
    (road l5 l17)
    (road l17 l5)
    (road l12 l23)
    (road l23 l12)
    (road l8 l22)
    (road l22 l8)
    (road l2 l15)
    (road l15 l2)
    (road l9 l12)
    (road l12 l9)
    (road l6 l24)
    (road l24 l6)
    (road l15 l25)
    (road l25 l15)
    (road l1 l12)
    (road l12 l1)
    (road l7 l13)
    (road l13 l7)
    (road l5 l20)
    (road l20 l5)
    (road l11 l13)
    (road l13 l11)
    (road l10 l20)
    (road l20 l10)
    (road l4 l17)
    (road l17 l4)
    (road l2 l9)
    (road l9 l2)
    (road l16 l26)
    (road l26 l16)
    (road l1 l22)
    (road l22 l1)
    (road l2 l24)
    (road l24 l2)
    (road l5 l9)
    (road l9 l5)
    (road l11 l26)
    (road l26 l11)
    (road l8 l20)
    (road l20 l8)
    (road l15 l26)
    (road l26 l15)
    (road l9 l16)
    (road l16 l9)
    (road l15 l16)
    (road l16 l15)
    (road l14 l27)
    (road l27 l14)
    (road l4 l20)
    (road l20 l4)
    (road l13 l14)
    (road l14 l13)
    (road l1 l25)
    (road l25 l1)
    (road l2 l6)
    (road l6 l2)
    (road l2 l5)
    (road l5 l2)
    (road l4 l8)
    (road l8 l4)
    (road l8 l14)
    (road l14 l8)
    (road l20 l21)
    (road l21 l20)
    (road l1 l24)
    (road l24 l1)
    (road l7 l24)
    (road l24 l7)
    (road l7 l19)
    (road l19 l7)
    (road l12 l21)
    (road l21 l12)
    (road l2 l17)
    (road l17 l2)
    (road l8 l26)
    (road l26 l8)
    (road l3 l9)
    (road l9 l3)
    (road l5 l14)
    (road l14 l5)
    (road l2 l3)
    (road l3 l2)
    (road l9 l24)
    (road l24 l9)
    (road l22 l24)
    (road l24 l22)
    (road l8 l18)
    (road l18 l8)
    (road l1 l23)
    (road l23 l1)
    (road l11 l22)
    (road l22 l11)
    (road l1 l26)
    (road l26 l1)
    (road l2 l10)
    (road l10 l2)
    (road l16 l24)
    (road l24 l16)
    (road l13 l20)
    (road l20 l13)
    (road l10 l15)
    (road l15 l10)
    (road l17 l26)
    (road l26 l17)
    (road l18 l19)
    (road l19 l18)
    (road l8 l17)
    (road l17 l8)
    (road l11 l18)
    (road l18 l11)
    (road l18 l20)
    (road l20 l18)
    (road l7 l22)
    (road l22 l7)
    (road l4 l25)
    (road l25 l4)
    (road l14 l24)
    (road l24 l14)
    (road l4 l27)
    (road l27 l4)
    (road l4 l18)
    (road l18 l4)
    (road l8 l11)
    (road l11 l8)
    (road l6 l9)
    (road l9 l6)
    (road l19 l25)
    (road l25 l19)
    (road l12 l15)
    (road l15 l12)
    (road l1 l8)
    (road l8 l1)
    (road l7 l25)
    (road l25 l7)
    )
 (:goal  (and 
    (at p1 l21)
    (at p2 l23)
    (at p3 l1)
    (at p4 l26)
    (at p5 l9)
    (at p6 l9)
    (at p7 l7)
    (at p8 l2)
    (at p9 l2)
    (at p10 l4)
    (at p11 l1)
    (at p12 l3)
    (at p13 l26)
    (at p14 l4)
    (at p15 l13)
    (at p16 l9)
    (at p17 l11)
    (at p18 l3)
    (at p19 l11)
    (at p20 l3))))
