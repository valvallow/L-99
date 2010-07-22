;; L-99
;; http://github.com/valvallow/L-99

;; P21 (*) Insert an element at a given position into a list.
;; Example:
;; * (insert-at 'alfa '(a b c d) 2)
;; (A ALFA B C D)

(use srfi-1)
(define (fold/index proc init ls . lss)
  (let1 idx 0
    (apply fold (lambda args
                  (begin0
                      (apply proc (append args (list idx)))
                    (set! idx (+ idx 1))))
           init (cons ls lss))))

(define (insert-at ele ls n)
  (let1 n (- n 1)
    (reverse
     (fold/index (lambda (e acc idx)
                   (cons e (if (= n idx)
                               (cons ele acc)
                               acc))) '() ls))))

(insert-at 'alfa '(a b c d) 2)
;; (a alfa b c d)


;; named-let
(define (insert-at ele ls n)
  (let rec ((ls ls)(acc '())(idx 1))
    (if (null? ls)
        (reverse acc)
        (rec (cdr ls)(cons (car ls)
                           (if (= n idx)
                               (cons ele acc)
                               acc))(+ idx 1)))))

(insert-at 'alfa '(a b c d) 2)
;; (a alfa b c d)
