;; L-99
;; http://github.com/valvallow/L-99

;; P04 (*) Find the number of elements of a list.


;; normal recur
(define (my-length ls)
  (if (null? ls)
      0
      (+ 1 (my-length (cdr ls)))))

(my-length '(1 2 3 4 5))
;; 5


;; letrec
(define (my-length ls)
  (letrec
      ((recur (lambda (ls acc)
                (if (null? ls)
                    acc
                    (recur (cdr ls)(+ acc 1))))))
    (recur ls 0)))

(my-length '(1 2 3 4 5))
;; 5


;; named-let
(define (my-length ls)
  (let loop ((ls ls)(acc 0))
    (if (null? ls)
        acc
        (loop (cdr ls)(+ acc 1)))))

(my-length '(1 2 3 4 5))
;; 5


;; fold
(define (my-length ls)
  (fold (lambda (e acc)
          (+ acc 1))
        0 ls))

(my-length '(1 2 3 4 5))
;; 5

