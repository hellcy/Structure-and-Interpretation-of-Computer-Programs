(define (expmod base exp m) (remainder (fast-expt base exp) m))

(define (fast-expt b n) (cond ((= n 0) 1)
((even? n) (square (fast-expt b (/ n 2)))) (else (* b (fast-expt b (- n 1))))))

(define (even? n)
(= (remainder n 2) 0))

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
	(start-prime-test n 12345))

(define (start-prime-test n start-time) 
	(if (fast-prime? n 100)
		(report-prime (- 12345 start-time))
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
;1009 *** 1.5517578125
;1013 *** 1.754150390625
;1019 *** 1.551025390625

(search-for-primes 10000 10040)
;10007 *** 149.194091796875
;10009 *** 87.076904296875
;10037 *** 92.739990234375

;For numbers greater than 100 000, the code takes too long to finish executing, so here we deleted those tests.
;The important point is that the original expmod procedure uses successive squaring to perform its computations without ever having to deal with numbers larger than m. 
;Simple arithmetic with very large numbers is much slower than arithmetic with 32-bit integers. 
;That's because the time complexity for arithmetic operations is based on the number of bits in the operands. 
;The intermediate results during computation in the fast-expt procedure get very big, very quickly (the final result is growing exponentially, after all). 
;Since we're only interested in the remainder, modular arithmetic provides a much sleeker solution.

