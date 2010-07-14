;; L-99
;; http://github.com/valvallow/L-99

;; P01 (*) Find the last box of a list.
;; Example:
;; * (my-last '(a b c d))
;; (D)


;; ver 1
(define (my-last ls)
  (cond ((null? ls) ls)
        ((null? (cdr ls)) ls)
        (else (my-last (cdr ls)))))

(my-last '(a b c d))
;; (d)
(my-last '())
;; ()

;; ver 2
(define (my-last ls)
  (if (or (null? ls)
          (null? (cdr ls)))
      ls
      (my-last (cdr ls))))

(my-last '(a b c d))
;; (d)
(my-last '())
;; ()


;; gauche
(last-pair '(a b c d))
;; (d)
(last-pair '())
;; *** ERROR: pair required: ()


;; ver 3
(define (my-last ls)
  (if (null? (cdr ls))
      ls
      (my-last (cdr ls))))

(my-last '(a b c d))
;; (d)
(my-last '())
;; error
(my-last '(a . b))
;; error


;; gauche
(last-pair '(a . b))
;; (a . b)


;; ver 4
(define (my-last ls)
  (cond ((null? (cdr ls)) ls)
        ((not (list? (cdr ls))) ls)
        (else (my-last (cdr ls)))))

(my-last '(a b c d))
;; (d)
(my-last '())
;; error
(my-last '(a . b))
;; (a . b)


;; ver 5
(define (my-last ls)
  (if (or (null? (cdr ls))
          (not (list? (cdr ls))))
      ls
      (my-last (cdr ls))))

(my-last '(a b c d))
;; (d)
(my-last '())
;; error
(my-last '(a . b))
;; (a . b)


;; answer
http://www.ic.unicamp.br/~meidanis/courses/mc336/2006s2/funcional/L-99_Ninety-Nine_Lisp_Problems.html



;; yet another
(define (my-last ls)
  (pair-fold (lambda (pr acc)
               (if (= (length pr) 1)
                   pr
                   acc))
             #f ls))


(my-last '(a b c d))
;; (d)
(my-last '())
;; #f
(my-last '(a . b))
;; error

