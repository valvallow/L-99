;; P13 (**) Run-length encoding of a list (direct solution).
;; Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem P09, but only count them. As in problem P11, simplify the result list by replacing the singleton lists (1 X) by X.

;; Example:
;; * (encode-direct '(a a a a b c c a a d e e e e))
;; ((4 A) B (2 C) (2 A) D (4 E))

(use srfi-1)
(use srfi-8)

(define (encode-direct ls)
  (let rec ((ls (reverse ls))(acc '()))
    (if (null? ls)
        acc
        (receive (taken dropped)
            (span (pa$ equal? (car ls)) ls)
          (rec dropped (cons (if (null? (cdr taken))
                                 (car taken)
                                 (list (length taken)(car taken)))
                             acc))))))


(use gauche.sequence)
(define (encode-direct ls)
  (map (^e (if (null? (cdr e))
               (car e)
               (list (length e)(car e))))
           (group-sequence ls)))


(use gauche.test)
(test* "" '()(encode-direct '()))
(test* "" '((4 a) b (2 c) (2 a) d (4 e))(encode-direct '(a a a a b c c a a d e e e e)))
