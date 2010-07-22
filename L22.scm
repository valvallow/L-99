;; L-99
;; http://github.com/valvallow/L-99

;; P22 (*) Create a list containing all integers within a given range.
;; If first argument is smaller than second, produce a list in decreasing order.
;; Example:
;; * (range 4 9)
;; (4 5 6 7 8 9)

(define (range min max)
  (let rec ((cnt max)(acc '()))
    (if (< cnt min)
        acc
        (rec (- cnt 1)(cons cnt acc)))))

(range 4 9)
;; (4 5 6 7 8 9)

(range 10 10)
;; (10)



(use srfi-1)

(define (range min max)
  (list-tabulate (+ (- max min) 1)
                 (lambda (n)
                   (+ n min))))

(range 4 9)
;; (4 5 6 7 8 9)

(define (range min max)
  (iota (+ (- max min) 1) min))

(range 4 9)
;; (4 5 6 7 8 9)

