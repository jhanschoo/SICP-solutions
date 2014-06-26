;; timed-prime-test : number -> ()
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

;; start-prime-test : number number -> ()
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

;; report-prime : number -> ()
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

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

;; prime? : number -> boolean
(define (prime? n)
  (= n (smallest-divisor n)))

;; square : number -> number
(define (square x) (* x x))

;; search-for-primes : number number -> ()
(define (search-for-primes first last)
  ;; search-iter : number number -> ()
  (define (search-iter n)
    (if (<= n last)
        (timed-prime-test n))
    (if (<= n last)
        (search-iter (+ n 2))))
  (search-iter (if (even? first)
                   (+ first 1)
                   first)))
