;; We define a column vector (a, b)'
;; Then, T(a, b)' is equivalent to a pre-multiplication of a matrix:
;; T(a, b)' === ((1, 1)', (1, 0)') * (a, b)'
;; T === ((1, 1)', (1, 0)')
;; Also observe that T[p, q](a, b)' === ((p+q, q)', (q, p)') * (a, b)'
;; === (bq + aq + ap, bp + aq)'

;; Hence T[p, q]^2 === T[q^2 + p^2, 2 * p * q + q^2]

;; square : number -> number
(define (square x)
  (* x x))

;; fib : number -> number
(define (fib n)
  (fib-iter 1 0 0 1 n))

;; fib-iter : number number number number number -> number
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (square q)
                      (* 2 p q))
                   (/ count 2)))
         (else (fib-iter (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                         p
                         q
                         (- count 1)))))
