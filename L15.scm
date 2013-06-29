;; P15 (**) Replicate the elements of a list a given number of times.
;; Example:
;; * (repli '(a b c) 3)
;; (A A A B B B C C C)

(use srfi-1)
(define (repli ls n)
  (append-map (^e (list-tabulate n (^ _ e))) ls))

(use gauche.test)
(test* "" '()(repli '() 3))
(test* "" '(a a a b b b c c c)(repli '(a b c) 3))

