;; L-99
;; http://github.com/valvallow/L-99

;; P10 (*) Run-length encoding of a list.
;; Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.

;; Example:
;; * (encode '(a a a a b c c a a d e e e e))
;; ((4 A) (1 B) (2 C) (2 A) (1 D)(4 E))


(use srfi-1)
(define (pack ls . opt)
  (let-optionals* opt ((eq? eq?))
    (pair-fold-right
     (lambda (pr acc)
       (apply acons (car pr)
              (if (or (null? acc)
                      (not (eq? (car pr)(caar acc))))
                  `(() ,acc)
                  `(,(car acc),(cdr acc)))))
     '() ls)))


;; ver 1
(define (encode ls)
  (let ((ls (pack ls)))
    (map (lambda (e)
           (list (length e)(car e)))
         ls)))

(encode '(a a a a b c c a a d e e e e))


