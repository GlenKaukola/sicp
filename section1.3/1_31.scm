#lang sicp
(#%require "../common.scm")

(define (pi)
  (* 4.0
     (/ (* 2 (product square 4 add-two 19998) 20000)
        (product square 3 add-two 19999))))

(define (factorial n)
  (product identity 1 inc n))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (add-two n) (+ n 2))
