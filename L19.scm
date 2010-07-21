;; L-99
;; http://github.com/valvallow/L-99

;; P19 (**) Rotate a list N places to the left.
;; Examples:
;; * (rotate '(a b c d e f g h) 3)
;; (D E F G H A B C)

;; * (rotate '(a b c d e f g h) -2)
;; (G H A B C D E F)

;; Hint: Use the predefined functions length and append, as well as the result of problem P17.

(use srfi-1)

;; L17.scm
(define (split ls n)
  (map (cut <> ls n)
       `(,take ,drop)))

(define (rotate ls n)
  (let1 n (if (negative? n)
              (+ (length ls) n)
              n)
    (concatenate (reverse (split ls n)))))

(rotate '(a b c d e f g h) 3)
;; (d e f g h a b c)
(rotate '(a b c d e f g h) -2)
;; (g h a b c d e f)
(rotate (map list '(a b c d e f g h)) 3)
;; ((d) (e) (f) (g) (h) (a) (b) (c))
(rotate (map list '(a b c d e f g h)) -2)
;; ((g) (h) (a) (b) (c) (d) (e) (f))
