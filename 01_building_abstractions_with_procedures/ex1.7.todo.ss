; With large numbers,
; the good-enough? test might not ever return a true value.
; this is because the floating-point representation numbers
; of sufficiently large numbers have a limited precision
; where two possible consecutive numbers may have their squares have a difference
; greater than 0.002, that when either is supplied to good-enough?, will
; never give a value of true.

; with small numbers,
; the good-enough might have too great of an allowance, and return
; values far away from the true sqare root.

; TODO: give examples of failure cases

;; good-enough? : number number -> boolean
;; this version of good-enough? uses a fractional test of x
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) (* 0.001 x)))