;; P21 (*) Insert an element at a given position into a list.
;; Example:
;; * (insert-at 'alfa '(a b c d) 2)
;; (A ALFA B C D)

(use gauche.sequence)
(define (insert-at x ls n)
  (reverse
   (fold-with-index (^(i e acc)
                      (cons e (if (= i (- n 1))
                                  (cons x acc)
                                  acc)))
                    '()
                    ls)))

(use gauche.test)
(test* "" '(a alfa b c d) (insert-at 'alfa '(a b c d) 2))

