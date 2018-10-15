(define (sum term a next b)
	(if (> a b)
		0
		(+ (term a)
			(sum term (next a) next b))))

(define (cube x)
	(* x x x))

(define (simpson f a b n)
	(define h
		(/ (- b a) n))

	(define (y k)
		(f (+ a (* k h))))

	(define (next x)
		(+ x 1))

	(define (term k)
   		(* (cond ((odd? k) 4)
            ((or (= k 0) (= k n)) 1)
            ((even? k) 2))
      	(y k)))

	(/ (* h (sum term 0 next n)) 3))


;A copy of the integral function from the textbook for comparison
(define (integral f a b dx) (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))
		
(integral cube 0 1 0.01)
(simpson cube 0 1 100.0)
(integral cube 0 1 0.001)
(simpson cube 0 1 1000.0)

;As you can see from these results, 
;Simpson's rule gives us a much better approximation to the integral when computing the same number of terms.
