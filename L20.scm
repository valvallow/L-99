;; P20 (*) Remove the K'th element from a list.
;; Example:
;; * (remove-at '(a b c d) 2)
;; (A C D)

(use gauche.sequence)
(define (remove-at ls n)
  (let1 n (if (negative? n)
              (+ (length ls) n)
              (- n 1))
    (reverse
     (fold-with-index (^(i e acc)
                        (if (= i n)
                            acc
                            (cons e acc)))
                      '()
                      ls))))

(use gauche.test)
(test* "" '(a c d)(remove-at '(a b c d) 2))
(test* "" '(a b d)(remove-at '(a b c d) -2))
