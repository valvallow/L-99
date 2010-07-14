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


;; (use srfi-1)
;; (define (my-but-last ls)
;;   (pair-fold (lambda (pr acc)
;;                (if (= (length pr) 2)
;;                    pr
;;                    acc))
;;              #f ls))

;; (my-but-last '(a b c d))
;; (c d)
;; (my-but-last '(c d))
;; (c d)
;; (my-but-last '(d))
;; #f
;; (my-but-last '())
;; #f

