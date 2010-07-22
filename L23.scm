;; L-99
;; http://github.com/valvallow/L-99

;; P23 (**) Extract a given number of randomly selected elements from a list.
;; The selected items shall be returned in a list.
;; Example:
;; * (rnd-select '(a b c d e f g h) 3)
;; (E D A)

;; Hint: Use the built-in random number generator and the result of problem P20.


(use srfi-27) ; random-integer

;; L20
(define (remove-at ls n)
  (let loop ((ls ls)
             (n (if (negative? n)
                    (+ (length ls) n)
                    (- n 1)))
             (acc '()))
    (if (zero? n)
        (append (reverse acc)(cdr ls))
        (loop (cdr ls)(- n 1)(cons (car ls) acc)))))

(define (rnd-select ls n)
  (let rec ((ls ls)(acc '()))
    (if (or (null? ls)
            (= n (length acc)))
        acc
        (let1 idx (random-integer (length ls))
          (rec (remove-at ls (+ idx 1))
               (cons (list-ref ls idx) acc))))))

(rnd-select '(a b c d e f g h) 3)
;; (c e a)
(rnd-select '(a b c d e f g h) 3)
;; (h e b)
(rnd-select '(a b c d e f g h) 3)
;; (f g h)