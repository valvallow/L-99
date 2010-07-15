;; L-99
;; http://github.com/valvallow/L-99


;; P02 (*) Find the last but one box of a list.
;; Example:
;; * (my-but-last '(a b c d))
;; (C D)

(define (my-but-last ls)
  (let ((kddr (cddr ls)))
    (if (null? kddr)
        ls
        (my-but-last kddr))))

(my-but-last '(a b c d))
;; (c d)
(my-but-last '(c d))
;; (c d)
(my-but-last '(d))
;; error
(my-but-last '())
;; error


(use srfi-1)
(define (my-but-last ls)
  (pair-fold (lambda (pr acc)
               (if (= (length pr) 2)
                   pr
                   acc))
             #f ls))

(my-but-last '(a b c d))
;; (c d)
(my-but-last '(c d))
;; (c d)
(my-but-last '(d))
;; #f
(my-but-last '())
;; #f


;; syntax-rules
(define-syntax my-but-last
  (syntax-rules ()
    ((_ (x y))
     '(x y))
    ((_ (x y z ...))
     (my-but-last (y z ...)))))

(my-but-last (a b c d))
;; (c d)
(my-but-last (c d))
;; (c d)
(my-but-last (d))
;; error
(my-but-last ())
;; error


;; failed option
(use srfi-1)
(define (my-but-last ls . opt)
  (let-optionals* opt ((failed #f))
    (pair-fold (lambda (pr acc)
                 (if (null? (cdr pr))
                     acc
                     pr))
                 failed ls)))

(my-but-last '(a b c d))
;; (c d)
(my-but-last '(c d))
;; (c d)
(my-but-last '(d))
;; #f
(my-but-last '() '())
;; ()


;; values
(define (my-but-last ls)
  (let1 r (pair-fold (lambda (pr acc)
                       (if (null? (cdr pr))
                           acc
                           pr))
                     #f ls)
    (values r (not (eq? r #f)))))

(my-but-last '(a b c d))
;; (c d)
;; #t
(my-but-last '(c d))
;; (c d)
;; #t
(my-but-last '(d))
;; #f
;; #f
(my-but-last '())
;; #f
;; #f


;; latest
(define (my-but-last ls . opt)
  (let-optionals* opt ((failed #f))
    (let/cc hop
      (pair-fold-right (lambda (pr acc)
                         (if (not (null? (cdr pr)))
                             (hop pr)
                             acc))
                       failed ls))))

(my-but-last '(a b c d))
;; (c d)
(my-but-last '(c d))
;; (c d)
(my-but-last '(d))
;; #f
(my-but-last '() '())
;; ()
