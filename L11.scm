;; P11 (*) Modified run-length encoding.
;; Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

;; Example:
;; * (encode-modified '(a a a a b c c a a d e e e e))
;; ((4 A) B (2 C) (2 A) D (4 E)).


;; L09
(define (pack ls :optional (cmpfn eq?))
  (and (not (null? ls))
       (let rec ((ls ls)(set '())(acc '()))
         (cond ((null? ls)(reverse (cons set acc)))
               ((or (null? set)(cmpfn (car ls)(car set)))
                (rec (cdr ls)(cons (car ls) set) acc))
               (else (rec (cdr ls)(cons (car ls) '()) (cons set acc)))))))

(define (encode ls)
  (and-let* ((packed (pack ls))
             packed
             ((map (^e (if (null? (cdr e))
                          (car e)
                          (list (length e)(car e))))
                  packed)))))

(use gauche.test)
(test* "" '((4 a) b (2 c) (2 a) d (4 e))(encode '(a a a a b c c a a d e e e e)))
