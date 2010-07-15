;; L-99
;; http://github.com/valvallow/L-99

;; P09 (**) Pack consecutive duplicates of list elements into sublists.
;; If a list contains repeated elements they should be placed in separate sublists.

;; Example:
;; * (pack '(a a a a b c c a a d e e e e))
;; ((A A A A) (B) (C C) (A A) (D) (E E E E))


;; ver 1 : named-let
(define (pack ls)
  (reverse
   (let loop ((ls ls)
              (acc '())
              (tac '()))
     (cond ((null? ls) (if (null? tac)
                           acc
                           (cons tac acc)))
           ((null? tac)
            (loop (cdr ls) acc (cons (car ls) tac)))
           ((equal? (car ls)(car tac))
            (loop (cdr ls) acc (cons (car ls) tac)))
           (else (loop (cdr ls)(cons tac acc)(cons (car ls) '())))))))

(pack '(a a a a b c c a a d e e e e))
;; ((a a a a) (b) (c c) (a a) (d) (e e e e))
(pack '(1))
;; ((1))
(pack '(1 2 3 1 2 3))
;; ((1) (2) (3) (1) (2) (3))
(pack '())
;; ()


;; ver 2
(define (pack ls)
  (reverse
   (let loop ((ls ls)
              (acc '())
              (tac '()))
     (cond ((null? ls) (if (null? tac)
                           acc
                           (cons tac acc)))
           ((or (null? tac)
                (equal? (car ls)(car tac)))
            (loop (cdr ls) acc (cons (car ls) tac)))
           (else (loop (cdr ls)(cons tac acc)(cons (car ls) '())))))))

(pack '(a a a a b c c a a d e e e e))
;; ((a a a a) (b) (c c) (a a) (d) (e e e e))
(pack '(1))
;; ((1))
(pack '(1 2 3 1 2 3))
;; ((1) (2) (3) (1) (2) (3))
(pack '())
;; ()


;; ver 3 : pair-fold
(use srfi-1)
(define (pack ls)
  (pair-fold-right
   (lambda (pr acc)
     (if (null? acc)
         (acons (car pr) '() acc)
         (if (equal? (car pr)(caar acc))
             (acons (car pr)(car acc)(cdr acc))
             (acons (car pr) '() acc))))
   '() ls))

(pack '(a a a a b c c a a d e e e e))
;; ((a a a a) (b) (c c) (a a) (d) (e e e e))
(pack '(1))
;; ((1))
(pack '(1 2 3 1 2 3))
;; ((1) (2) (3) (1) (2) (3))
(pack '())
;; ()


;; ver 4
(define (pack ls)
  (pair-fold-right
   (lambda (pr acc)
     (if (or (null? acc)
             (not (equal? (car pr)(caar acc))))
         (acons (car pr) '() acc)
         (acons (car pr)(car acc)(cdr acc))))
   '() ls))

(pack '(a a a a b c c a a d e e e e))
;; ((a a a a) (b) (c c) (a a) (d) (e e e e))
(pack '(1))
;; ((1))
(pack '(1 2 3 1 2 3))
;; ((1) (2) (3) (1) (2) (3))
(pack '())
;; ()


;; ver 5
(define (pack ls)
  (pair-fold-right
   (lambda (pr acc)
     (apply acons (car pr)
            (if (or (null? acc)
                    (not (equal? (car pr)(caar acc))))
                `(() ,acc)
                `(,(car acc),(cdr acc)))))
   '() ls))

(pack '(a a a a b c c a a d e e e e))
;; ((a a a a) (b) (c c) (a a) (d) (e e e e))
(pack '(1))
;; ((1))
(pack '(1 2 3 1 2 3))
;; ((1) (2) (3) (1) (2) (3))
(pack '())
;; ()


;; ver 6
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

(pack '(a a a a b c c a a d e e e e))
;; ((a a a a) (b) (c c) (a a) (d) (e e e e))
(pack '(1))
;; ((1))
(pack '(1 2 3 1 2 3))
;; ((1) (2) (3) (1) (2) (3))
(pack '())
;; ()
(pack (map (cut cons <> '())
           '(a a a a b c c a a d e e e e)))
;; (((a)) ((a)) ((a)) ((a)) ((b)) ((c)) ((c)) ((a)) ((a)) ((d)) ((e)) ((e)) ((e)) ((e)))
(pack (map (cut cons <> '())
           '(a a a a b c c a a d e e e e)) equal?)
;; (((a) (a) (a) (a)) ((b)) ((c) (c)) ((a) (a)) ((d)) ((e) (e) (e) (e)))

