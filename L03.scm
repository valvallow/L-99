;; P03 (*) Find the K'th element of a list.
;; The first element in the list is number 1.
;; Example:
;; * (element-at '(a b c d e) 3)
;; C

(define (element-at ls n)
  (list-ref ls (- n 1)))


(define (element-at ls n)
  (if (= n 1)
      (car ls)
      (element-at (cdr ls)(- n 1))))


(use gauche.test)
(test-start "elemet-at")
(test* "" 'c (element-at '(a b c d e) 3))
(test* "" 'a (element-at '(a b c d e) 1))
