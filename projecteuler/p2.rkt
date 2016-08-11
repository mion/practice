;; https://projecteuler.net/problem=2
#lang racket
(
(define (fib n)
  (cond [(= 1 n) '(1)]
        [(= 2 n) '(2 1)]
        [else (let ([fib-lst (fib (sub1 n))])
                (cons (+ (car fib-lst) (car (cdr fib-lst))) fib-lst))]))

;; TO FINISH

