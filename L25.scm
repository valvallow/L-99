;; L-99
;; http://github.com/valvallow/L-99

;; P25 (*) Generate a random permutation of the elements of a list.
;; Example:
;; * (rnd-permu '(a b c d e f))
;; (B A D C E F)

;; Hint: Use the solution of problem P23.


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

;; L23
(define (rnd-select ls n)
  (let rec ((ls ls)(acc '()))
    (if (or (null? ls)
            (= n (length acc)))
        acc
        (let1 idx (random-integer (length ls))
          (rec (remove-at ls (+ idx 1))
               (cons (list-ref ls idx) acc))))))


(define (rnd-permu ls)
  (rnd-select ls (length ls)))

(rnd-permu '(a b c d e f))
;; (b e a f d c)
(rnd-permu '(a b c d e f))
;; (a c e b d f)