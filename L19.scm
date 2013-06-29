;; P19 (**) Rotate a list N places to the left.
;; Examples:
;; * (rotate '(a b c d e f g h) 3)
;; (D E F G H A B C)

;; * (rotate '(a b c d e f g h) -2)
;; (G H A B C D E F)

;; Hint: Use the predefined functions length and append, as well as the result of problem P17.

;; L17.scm
(use srfi-1)
(define (split ls n)
  (list (take ls n)(drop ls n)))

(define (rotate ls n)
  (let1 n (if (negative? n)
              (+ (length ls) n)
              n)
    (apply append (reverse (split ls n)))))

(use gauche.test)
(test* "" '(d e f g h a b c)(rotate '(a b c d e f g h) 3))
(test* "" '(g h a b c d e f)(rotate '(a b c d e f g h) -2))
