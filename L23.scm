;; P23 (**) Extract a given number of randomly selected elements from a list.
;; The selected items shall be returned in a list.
;; Example:
;; * (rnd-select '(a b c d e f g h) 3)
;; (E D A)

;; Hint: Use the built-in random number generator and the result of problem P20.


(use gauche.sequence)
(use srfi-1)

(define (rnd-select ls n)
  (take (shuffle ls) n))

;; test
(dotimes (i 10)
  (print (rnd-select '(a b c d e f g h) 3)))
