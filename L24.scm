;; L-99
;; http://github.com/valvallow/L-99

;; P24 (*) Lotto: Draw N different random numbers from the set 1..M.
;; The selected numbers shall be returned in a list.
;; Example:
;; * (lotto-select 6 49)
;; (23 1 17 33 21 37)

;; Hint: Combine the solutions of problems P22 and P23.


(use srfi-1) ; iota
(use srfi-27) ; random-integer

;; L22
(define (range min max)
  (iota (+ (- max min) 1) min))

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


(define (lotto-select n max)
  (rnd-select (range 1 max) n))

(lotto-select 6 49)
;; (36 40 33 25 22 23)
