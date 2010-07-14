;; L-99
;; http://github.com/valvallow/L-99

;; P08 (**) Eliminate consecutive duplicates of list elements.
;; If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

;; Example:
;; * (compress '(a a a a b c c a a d e e e e))
;; (A B C A D E)


(use srfi-1)

;; ver 1
(define (compress ls)
  (pair-fold (lambda (pr acc)
               (if (null? (cdr pr))
                   (append acc pr)
                   (if (equal? (car pr)(cadr pr))
                       acc
                       (append acc (list (car pr))))))
             '() ls))

(compress '(a a a a b c c a a d e e e e))
;; (a b c a d e)
(compress '(a b))
;; (a b)
(compress '(a))
;; (a)


;; ver 2 : let/cc
(define (compress ls)
  (pair-fold
   (lambda (pr acc)
     (let/cc hop
       (append acc
               (if (null? (cdr pr))
                   pr
                   (if (equal? (car pr)(cadr pr))
                       (hop acc)
                       (list (car pr)))))))
   '() ls))

(compress '(a a a a b c c a a d e e e e))
;; (a b c a d e)
(compress '(a b))
;; (a b)
(compress '(a))
;; (a)


;; option
(define (compress ls . opt)
  (let-optionals* opt ((ep? equal?))
    (pair-fold
     (lambda (pr acc)
       (let/cc hop
         (append acc
                 (if (null? (cdr pr))
                     pr
                     (if (ep? (car pr)(cadr pr))
                         (hop acc)
                         (list (car pr)))))))
     '() ls)))


(compress '(a a a a b c c a a d e e e e))
;; (a b c a d e)
(compress '(a b))
;; (a b)
(compress '(a))
;; (a)
(compress (map (cut cons <> '()) '(a a a a b c c a a d e e e e)) eq?)
;; ((a) (a) (a) (a) (b) (c) (c) (a) (a) (d) (e) (e) (e) (e))
(compress (map (cut cons <> '()) '(a a a a b c c a a d e e e e)))
;; ((a) (b) (c) (a) (d) (e))


;; tail call
(define (compress ls)
  (let loop ((ls ls)(acc '()))
    (if (or (null? ls)
            (null? (cdr ls)))
        (append acc ls)
        (loop (cdr ls)
              (append acc (if (equal? (car ls)(cadr ls))
                              '()
                              (list (car ls))))))))

(compress '(a a a a b c c a a d e e e e))
;; (a b c a d e)
(compress '(a b))
;; (a b)
(compress '(a))
;; (a)


