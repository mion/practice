;; https://projecteuler.net/problem=3
;; The prime factors of 13195 are 5, 7, 13 and 29.
;; What is the largest prime factor of the number 600851475143 ?
#lang racket

(define-syntax-rule (while condition body ...)
  (let loop ()
    (when condition
      body ...
      (loop))))

(define (any fn lst)
    (not (empty? (filter fn lst))))

(define (odd-numbers-up-to n)
  (filter odd? (build-list (inexact->exact (round (add1 n))) values)))

(define (prime? n)
  (cond [(<= n 1) #f]
        [(= n 2) #t]
        [(even? n) #f]
        [else (empty? (filter (lambda (m) (= 0 (remainder n m))) (cdr(odd-numbers-up-to (sqrt n)))))]))

(define (factors n)
  (filter (lambda (m) (= 0 (remainder n m))) (map add1 (build-list n values))))

(define (max-of-list lst)
  (eval (cons 'max lst)))

(define (largest-prime-factor n)
  (max-of-list (filter prime? (factors n))))

;; STOPPED HERE: this not working even with 512 MB of memory... make it more efficient!

