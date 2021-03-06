#lang sicp

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat n d) 
  (let ((g ((if (< d 0) - +) (gcd n d)))) 
    (cons (/ n g) (/ d g))))

(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))

