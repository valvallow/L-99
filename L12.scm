;; P12 (**) Decode a run-length encoded list.
;; Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.

;; (decode-run-length-encoded-list '((4 a) b (2 c) (2 a) d (4 e)))
;; (a a a a b c c a a d e e e e)


(use srfi-1)
(define (decode-run-length-encoded-list ls)
  (append-map (^e (if (list? e)
                      (list-tabulate (car e) (^ _ (cadr e)))
                      (list e)))
              ls))

(use gauche.test)
(test* "" '(a a a a b c c a a d e e e e)
       (decode-run-length-encoded-list '((4 a) b (2 c) (2 a) d (4 e))))
