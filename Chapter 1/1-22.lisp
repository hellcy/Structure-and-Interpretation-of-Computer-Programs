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

(define (find-divisor n test-divisor) 
	(cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
(else (find-divisor n (+ test-divisor 1))))) 

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
;1009 *** 0.003173828125
;1013 *** 0.0029296875
;1019 *** 0.0029296875
(search-for-primes 10000 10040)
;10007 *** 0.009033203125
;10009 *** 0.0078125
;10037 *** 0.009033203125
;ratio 3.07
(search-for-primes 100000 100045)
;100003 *** 0.02392578125
;100019 *** 0.02392578125
;100043 *** 0.02490234375
;ratio 2.65
(search-for-primes 1000000 1000040)
;1000003 *** 0.076171875
;1000033 *** 0.075927734375
;1000037 *** 0.075927734375
;ratio 3.17