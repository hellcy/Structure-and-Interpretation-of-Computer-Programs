#lang racket
(define (expmod base exp m) 
	(cond ((= exp 0) 1)
        ((even? exp) (remainder (sqr (expmod base (/ exp 2) m)) m)) 
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n) (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times) 
	(cond ((= times 0) true)
		((fermat-test n) (fast-prime? n (- times 1))) 
		(else false)))

(define (timed-prime-test n) 
	(newline)
	(display n)
	(start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time) 
	(if (fast-prime? n 100)
		(report-prime (- (current-inexact-milliseconds) start-time))
		(display " *** not a prime"))) 

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end)
   (if (even? start)
       (search-for-primes (+ start 1) end)
       (cond ((< start end) (timed-prime-test start)
                            (search-for-primes (+ start 2) end)))))

(search-for-primes 1000 1020)
;1009 *** 0.159912109375 *** 0.001953125 ratio: 81.8
;1013 *** 0.160888671875 *** 0.001953125 ratio:82.375
;1019 *** 0.1669921875 *** 0.0029296875 ratio: 57.0
(search-for-primes 10000 10040)
;10007 *** 0.2041015625 *** 0.005859375 ratio: 34.83
;10009 *** 0.196044921875 *** 0.005126953125 ratio: 38.23
;10037 *** 0.203125 *** 0.005126953125 ratio:39.61
(search-for-primes 100000 100045)
;100003 *** 0.23193359375 *** 0.01611328125 ratio: 14.39
;100019 *** 0.239013671875 *** 0.01611328125 ratio: 14.83
;100043 *** 0.240966796875 *** 0.01611328125 ratio: 14.95
(search-for-primes 1000000 1000040)
;1000003 *** 0.268798828125 *** 0.046875 ratio: 5.73
;1000033 *** 0.27294921875 *** 0.0478515625 ratio: 5.7
;1000037 *** 0.281005859375 *** 0.048095703125 ratio: 5.84