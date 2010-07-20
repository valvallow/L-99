;; L-99
;; http://github.com/valvallow/L-99

;; P12 (**) Decode a run-length encoded list.
;; Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.

;; (decode-run-length-encoded-list '((4 a) b (2 c) (2 a) d (4 e)))
;; (a a a a b c c a a d e e e e)


;; ---ver1---------------------------------------------------------

;; sub proc
(define (spread-run-length-list ls)
  (let loop ((ls ls)(acc '()))
    (if (zero? (car ls))
        acc
        (loop (list (- (car ls) 1)(cadr ls))
              (cons (cadr ls) acc)))))

(spread-run-length-list (car '((4 a) b (2 c) (2 a) d (4 e))))
;; (a a a a)


(use srfi-1)
(define (decode-run-length-encoded-list ls)
  (fold-right (lambda (e acc)
                (fold-right (lambda (e a)
                              (cons e a)) acc e))
              '()
              (map (lambda (e)
                     (if (list? e)
                         (spread-run-length-list e)
                         (list e)))
                   ls)))

(decode-run-length-encoded-list '((4 a) b (2 c) (2 a) d (4 e)))



;; ---ver2---------------------------------------------------------

;; L07
(define (flatten tree)
  (fold (lambda (e acc)
          (append acc
                  (if (list? e)
                      (flatten e)
                      (list e))))
        '() tree))


(define (decode-run-length-encoded-list ls)
  (flatten (map (lambda (e)
                  (if (list? e)
                      (spread-run-length-list e)
                      (list e)))
                ls)))

(decode-run-length-encoded-list '((4 a) b (2 c) (2 a) d (4 e)))