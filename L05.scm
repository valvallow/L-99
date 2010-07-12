;; L-99
;; http://github.com/valvallow/L-99

;; P05 (*) Reverse a list.


;; letrec
(define (my-reverse ls)
  (letrec
      ((recur (lambda (ls acc)
                (if (null? ls)
                    acc
                    (recur (cdr ls)(cons (car ls) acc))))))
    (recur ls '())))

(my-reverse '(1 2 3))
;; (3 2 1)


;; named-let
(define (my-reverse ls)
  (let loop ((ls ls)(acc '()))
    (if (null? ls)
        acc
        (loop (cdr ls)(cons (car ls) acc)))))

(my-reverse '(1 2 3))
;; (3 2 1)


;; fold
(define (my-reverse ls)
  (fold cons '() ls))

(my-reverse '(1 2 3))
;; (3 2 1)



