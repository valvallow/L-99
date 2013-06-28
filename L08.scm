;; L-99
;; http://github.com/valvallow/L-99

;; P08 (**) Eliminate consecutive duplicates of list elements.
;; If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

;; Example:
;; * (compress '(a a a a b c c a a d e e e e))
;; (A B C A D E)


(define (compress ls :optional (cmpfn eq?))
  (let rec ((ls ls)(acc '()))
    (if (null? ls)
        (reverse acc)
        (rec (cdr ls)(if (or (null? acc)
                             (not (cmpfn (car ls)(car acc))))
                         (cons (car ls) acc)
                         acc)))))

(define (compress ls :optional (cmpfn eq?))
  (fold-right (^(e acc)
          (if (or (null? acc)
                  (not (cmpfn e (car acc))))
              (cons e acc)
              acc))
        '()
        ls))

(use gauche.test)
(test* "" '()(compress '()))
(test* "" '(a)(compress '(a)))
(test* "" '(a b)(compress '(a a b b)))
(test* "" '(a b a b)(compress '(a a b a a a a b b)))
(test* "" '(a b c a d e)(compress '(a b c c a a d e )))
(test* "" '(a b c a d e)(compress '(a a a a b c c a a d e )))
(test* "" '(a b c a d e)(compress '(a a a a b c c a a d e e e e)))
(test* "" '((a b)(c a)(d e))(compress '((a b)(a b)(a b)(c a)(c a)(d e)(d e)) equal?))





