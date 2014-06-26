;; To prove: Fib(n) = min[x in Z] |x - phi^n / sqrt(5)|
;; where phi = (1 + sqrt(5))/2

;; We first prove that Fib(n) = (phi^n - psi^n) / sqrt(5)
;; where psi = (1 - sqrt(5))/2

;; Fib(0) = 0 = (1 - 1) / sqrt(5)
;; Fib(1) = 1 = (1 + sqrt(5) - 1 + sqrt(5)) / (2 * sqrt(5))
;; To prove: Fib(n-2) = (phi^(n-2) - psi^(n-2)) / sqrt(5) and Fib(n-1) = (phi^(n-1) - psi^(n-1))
;; imply Fib(n) = (phi^n - psi^n) / sqrt(5)
;; Fib(n)
;; = Fib(n-2) + Fib(n-1)
;; = (phi^(n-2) + phi^(n-1) - psi^(n-2) - psi(n - 1)) / sqrt(5)

;; Consider that
;; phi^(n-2) + phi^(n-1)
;; = phi^(n-2) * (1 + phi)

;; Consider that
;; (1 + phi)
;; = (2 + 1 + sqrt(5)) / 2
;; = 2 * (3 + sqrt(5)) / 4
;; = (1 + 2 * sqrt(5) + 5) / 4
;; = (1 + sqrt(5))^2 / 2^2 = phi^2

;; hence phi^(n-2) + phi^(n-1)
;; = phi

;; Consider that
;; psi^(n-2) + psi^(n-1)
;; = psi^(n-2) * (1 + psi)

;; Consider that
;; (1 + psi)
;; = (2 + 1 - sqrt(5)) / 2
;; = 2 * (3 - sqrt(5)) / 4
;; = (1 - 2 * sqrt(5) + 5) / 4
;; = (1 - sqrt(5))^2 / 2^2 = psi^2

;; hence psi^(n-2) + psi^(n-1)
;; = psi

;; hence
;; (phi^(n-2) + phi^(n-1) - psi^(n-2) - psi(n - 1)) / sqrt(5)
;; = phi^n - psi^n / sqrt(5)
;; = Fib(n)

;; Now, Fib(n) = (phi^n - psi^n) / sqrt(5)
;; Fib(n) - phi^n / sqrt(5) = -psi^n / sqrt(5)
;; but -0.5 < phi / sqrt(5) < 0.5; hence -0.5 < phi^n / sqrt(5) < 0,5
;; hence Fib(n) is the closest integer.
