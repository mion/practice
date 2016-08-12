;; https://projecteuler.net/problem=1
#lang racket

(define (is-multiple-3-or-5? n)
  (or (= 0 (remainder n 3))
      (= 0 (remainder n 5))))

(define (naturals-up-to n curr)
  (if (= n curr)
      (cons n null)
      (when (< curr n)
        (cons curr (naturals-up-to n (add1 curr))))))

(define (nats n)
  (naturals-up-to (- n 1) 1))

(define (sum l)
  (foldl + 0 l))

(define (answer n)
  (sum (filter is-multiple-3-or-5? (nats n))))
