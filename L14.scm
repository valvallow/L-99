;; L-99
;; http://github.com/valvallow/L-99

;; P14 (*) Duplicate the elements of a list.
;; Example:
;; * (dupli '(a b c c d))
;; (A A B B C C C C D D)

(use srfi-1)
(define (dupli ls)
  (append-map (^e (list e e))
              ls))

(use gauche.test)
(test* "" '()(dupli'()))
(test* "" '(a a b b c c c c d d)(dupli '(a b c c d)))

