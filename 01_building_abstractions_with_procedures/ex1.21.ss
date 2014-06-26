;; square : number -> number
(define (square x)
  (* x x))

;; smallest-divisor : number -> number
(define (smallest-divisor n)
  (find-divisor n 2))

;; find-divisor : number number -> number
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n ) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

;; divides? : number number -> boolean
(define (divides? a b)
  (= (remainder b a) 0))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)