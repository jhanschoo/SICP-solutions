;; 1.1.2 Naming and the environment

(define size 2)

(define pi 3.14159)

(define radius 10)

(define circumference (* 2 pi radius))

;; 1.1.4 Compound procedures

;; square : number -> number
(define (square x) (* x x))

;; sum-of-squares : number number -> sumber
;; depends : square
(define (sum-of-squares x y)
  (+ (square x) (square y)))

;; f : number -> number
;; depends : sum-of-squares
(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

;; 1.1.6

;; abs : number -> number
;(define (abs x)
;  (cond ((> x 0) x)
;        ((= x 0) 0)
;        ((< x 0) (- x))))
(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))
;(define (abs x)
;  (if (< x 0)
;      (- x)
;      x))

;; >= : number number -> number
;(define >= x y
;  (or (> x y) (= x y)))
;(define (>= x y)
;  (not (< x y)))

;; 1.1.7

;; sqrt-iter : number number -> number
;; depends : good-enough? improve
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

;; improve : number number -> number
;; depends : average
(define (improve guess x)
  (average guess (/ x guess)))

;; average : number number -> number
(define (average x y)
  (/ (+ x y) 2))

;; good-enough? : number number -> boolean
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; sqrt : number -> number
;; depends : sqrt-iter
(define (sqrt x)
  (sqrt-iter 1.0 x))

;; 1.2.1
;; factorial : number -> number
;; recursive version
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

;; factorial : number -> number
;; depends : fact-iter
;; iterative version
(define (factorial n)
  (fact-iter 1 1 n))

;; fact-iter : number number number -> number
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

;; 1.2.2

;; fib : number -> number
;; naive recursive method
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

;; fib : number -> number
;; depends : fib-iter
;; iterative window method
(define (fib n)
  (fib-iter 1 0 n))

;; fib-iter : number number number -> number
(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ 1 b) a (- count 1))))

;; count-change : number -> number
(define (count-change amount)
  (cc amount 5))

;; cc : number number -> number
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins)))))))

;; first-denomination : number -> number
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

;; 1.2.4

;; expt : number number -> number
;; linear recursive: Theta(n) time and Theta(n) space
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

;; expt number number -> number
;; linear iterative: Theta(n) time and Theta(1) space
(define (expt b n)
  (expt-iter b n 1))

;; expt-iter : number number number -> number
(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                 (- counter 1)
                 (* b product))))

;; fast-expt : number number -> number
;; log recursive: Theta(log n) time and Theta(log n) space
(define (fast-expr b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;; even? : number -> boolean
(define (even? n)
  (= (remainder n 2) 0))

;; 1.2.5

;; gcd : number number -> number
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; 1.2.6

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

;; expmod : number number number -> number
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;; fermat-test : number -> boolean
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

; fast-prime? : number number -> number
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
