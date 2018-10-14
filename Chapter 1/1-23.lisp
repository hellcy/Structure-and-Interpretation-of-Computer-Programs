#lang racket
(define (timed-prime-test n) 
	(newline)
	(display n)
	(start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time) 
	(if (prime? n)
		(report-prime (- (current-inexact-milliseconds) start-time))
		(display " *** not a prime"))) 

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n) 
	(find-divisor n 2))

(define (next test-divisor)
  (cond ((= test-divisor 2) 3)
        (else (+ test-divisor 2))))

(define (find-divisor n test-divisor) 
	(cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
(else (find-divisor n (next test-divisor))))) 

(define (divides? a b) 
	(= (remainder b a) 0))

(define (prime? n)
(= n (smallest-divisor n)))

(define (square n)
  (* n n))

(define (search-for-primes start end)
   (if (even? start)
       (search-for-primes (+ start 1) end)
       (cond ((< start end) (timed-prime-test start)
                            (search-for-primes (+ start 2) end)))))

(define (even? n)
   (= (remainder n 2) 0))

(search-for-primes 1000 1020)
;1009 *** 0.003173828125 *** 0.001953125 ratio: 1.625
;1013 *** 0.0029296875 *** 0.001953125 ratio:1.5
;1019 *** 0.0029296875 *** 0.0029296875 ratio: 1.0
(search-for-primes 10000 10040)
;10007 *** 0.009033203125 *** 0.005859375 ratio: 1.54
;10009 *** 0.0078125 *** 0.005126953125 ratio: 1.52
;10037 *** 0.009033203125 *** 0.005126953125 ratio:1.76
(search-for-primes 100000 100045)
;100003 *** 0.02392578125 *** 0.01611328125 ratio: 1.48
;100019 *** 0.02392578125 *** 0.01611328125 ratio: 1.48
;100043 *** 0.02490234375 *** 0.01611328125 ratio: 1.54
(search-for-primes 1000000 1000040)
;1000003 *** 0.076171875 *** 0.046875 ratio: 1.625
;1000033 *** 0.075927734375 *** 0.0478515625 ratio: 1.58
;1000037 *** 0.075927734375 *** 0.048095703125 ratio: 1.58

; The improved ratio is less than. 
;This may be explained by the fact that we replaced a primitive operation, (+ test-divisor 1), by a user-defined operation, (next test-divisor).
;Each time that user-defined operation is called, an extra if must be evaluated (to check if the input is 2). 
;Other than this small discrepancy, I think the improvement is quite good for such a small change to the code.

