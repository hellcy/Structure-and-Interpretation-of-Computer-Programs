(define (p) (p))
(define (test x y)
	(if (= x 0)
		0
		y))

(test 0 (p))

;Normal-order evaluation is the "fully expand and then reduce" option. 
;Under normal-order evaluation, (test 0 (p)) is fully expanded as

;(test 0 (p)) ==
;(if (= 0 0)
;  0
;  (p))

;and the test condition in the expansion is (= 0 0), which is true, 
;the normal-order evaluator determines to evaluate the consequent, which is 0, so the value of the expression is 0.

;Using the applicative-order evaluation however, the first step in evaluating (test 0 (p)) is to evaluate the expressions test, 0, and (p), 
;and then call ("apply", hence "applicative") the value of test with the values produced by evaluating 0 and (p). 
;Since the evaluation of (p) will not complete, neither will the evaluation of (test 0 (p)).