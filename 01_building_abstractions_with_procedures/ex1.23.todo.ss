;; square : number -> number
(define (square n)
  (* n n))

;; smallest-divisor : number -> number
(define (smallest-divisor n)
  (find-divisor n 2))

;; next : number -> number
(define (next n)
  (if (= n 2)
      3
      (+ n 2)))


;; divides? : number number -> boolean
(define (divides? a b)
  (= (remainder b a) 0))

;; find-divisor : number number -> number
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n ) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
