(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 p)

; with applicative-order evaluation Ben will observe that
; in test, (= x 0) is evaluated, and y is never evaluated.
; hence 0 will be returned.

; with normal-order evaluation, from (test 0 p), p will be
; applied (i.e. expanded) before test is evaluated. But since
; p is recursively defined with no base case, the application
; of p will not terminate.