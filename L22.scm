;; P22 (*) Create a list containing all integers within a given range.
;; If first argument is smaller than second, produce a list in decreasing order.
;; Example:
;; * (range 4 9)
;; (4 5 6 7 8 9)

(define (range start end)
  (iota (- end (- start 1)) start))

(use gauche.test)
(test* "" '(4 5 6 7 8 9) (range 4 9))


