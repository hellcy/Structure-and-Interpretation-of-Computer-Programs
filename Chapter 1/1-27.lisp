(define (expmod base exp m) 
	(cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m)) 
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n a)
    (= (expmod a n n) a))

(define (carmichael n)
	(display "\n")
	(display n)
	(define (iter a)
	(cond ((= a 1) #t)
		((not (fermat-test n a)) #f)
		(else (iter (- a 1)))))
	(if (iter (- n 1)) 
		(display " *** is a prime.")
		(display " *** is NOT a prime.")))

(carmichael 561)
(carmichael 1105)
(carmichael 1729)
(carmichael 2465)
(carmichael 2821)
(carmichael 6601)
(carmichael 9)



