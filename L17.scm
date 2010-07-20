;; L-99
;; http://github.com/valvallow/L-99

;; P17 (*) Split a list into two parts; the length of the first part is given.
;; Do not use any predefined predicates.

;; Example:
;; * (split '(a b c d e f g h i k) 3)
;; ( (A B C) (D E F G H I K))

(define (take-n ls n)
  (let loop ((ls ls)(n n)(acc '()))
    (if (zero? n)
        (reverse acc)
        (loop (cdr ls)(- n 1)(cons (car ls) acc)))))

(define (drop-n ls n)
  (if (zero? n)
      ls
      (drop-n (cdr ls)(- n 1))))

(define (split ls n)
  (map (cut <> ls n)
       `(,take-n ,drop-n)))

(split '(a b c d e f g h i k) 3)
;; ((a b c) (d e f g h i k))




(define take (with-module srfi-1 take))
(define drop (with-module srfi-1 drop))

(define (split ls n)
  (map (cut <> ls n)
       `(,take ,drop)))

(split '(a b c d e f g h i k) 3)
;; ((a b c) (d e f g h i k))
