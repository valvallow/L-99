;; P17 (*) Split a list into two parts; the length of the first part is given.
;; Do not use any predefined predicates.

;; Example:
;; * (split '(a b c d e f g h i k) 3)
;; ((A B C) (D E F G H I K))

(use srfi-1)
(define (split ls n)
  (list (take ls n)(drop ls n)))

(use gauche.test)
(test* "" '((a b c) (d e f g h i k))(split '(a b c d e f g h i k) 3))
