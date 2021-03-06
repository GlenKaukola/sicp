#lang sicp
(#%require "../common.scm")

(define (largest-sum-of-squares x y z)

  (define (sum-of-squares x y)
    (+ (square x) (square y)))
  
  (cond ((and (>= x y) (>= y z)) (sum-of-squares x y))
        ((and (>= x y) (>= z y)) (sum-of-squares x z))
        (else (sum-of-squares y z))))