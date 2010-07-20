;; L-99
;; http://github.com/valvallow/L-99

;; P11 (*) Modified run-length encoding.
;; Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

;; Example:
;; * (encode-modified '(a a a a b c c a a d e e e e))
;; ((4 A) B (2 C) (2 A) D (4 E)).


;; L09
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


(define (encode ls)
  (let ((ls (pack ls)))
    (map (lambda (e)
           (if (null? (cdr e))
               (car e)
               (list (length e)(car e))))
         ls)))

(encode '(a a a a b c c a a d e e e e))
;; ((4 a) b (2 c) (2 a) d (4 e))