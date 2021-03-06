#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (branch-weight branch)
  (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (balanced-mobile? mobile)
  (if (pair? mobile)
      (and (= (* (total-weight (left-branch mobile))
                 (branch-length (left-branch mobile)))
              (* (total-weight (right-branch mobile))
                 (branch-length (right-branch mobile))))
           (balanced-mobile? (branch-structure (left-branch mobile)))
           (balanced-mobile? (branch-structure (right-branch mobile))))
      true))

(define (make-mobile2 left right)
  (cons left right))

(define (make-branch2 length structure)
  (cons length structure))
