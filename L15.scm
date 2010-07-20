;; L-99
;; http://github.com/valvallow/L-99

;; P15 (**) Replicate the elements of a list a given number of times.
;; Example:
;; * (repli '(a b c) 3)
;; (A A A B B B C C C)


(use srfi-1)

;; L07
(define (flatten tree)
  (fold (lambda (e acc)
          (append acc
                  (if (list? e)
                      (flatten e)
                      (list e))))
        '() tree))

;; L12
(define (spread-run-length-list ls)
  (let loop ((ls ls)(acc '()))
    (if (zero? (car ls))
        acc
        (loop (list (- (car ls) 1)(cadr ls))
              (cons (cadr ls) acc)))))

;; L12
(define (decode-run-length-encoded-list ls)
  (flatten (map (lambda (e)
                  (if (list? e)
                      (spread-run-length-list e)
                      (list e)))
                ls)))


(define (repli ls n)
  (decode-run-length-encoded-list
   (map (lambda (e)
          (list n e)) ls)))

(repli '(a b c) 3)
;; (a a a b b b c c c)



;; yet another
(define (repli ls n)
  (fold-right (lambda (ele acc)
                (let loop ((n n)(acc acc))
                  (if (zero? n)
                      acc
                      (loop (- n 1)(cons ele acc)))))
              '() ls))

(repli '(a b c) 3)
;; (a a a b b b c c c)
