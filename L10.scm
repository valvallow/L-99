;; P10 (*) Run-length encoding of a list.
;; Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.

;; Example:
;; * (encode '(a a a a b c c a a d e e e e))
;; ((4 A) (1 B) (2 C) (2 A) (1 D)(4 E))

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
             ((map (^e (list (length e)(car e))) packed)))))

(use gauche.test)
(test* ""  #f (encode '()))
(test* ""  '((4 a) (1 b) (2 c) (2 a) (1 d)(4 e)) (encode '(a a a a b c c a a d e e e e)))

