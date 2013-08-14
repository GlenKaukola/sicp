(define get 2d-get)
(define put 2d-put!)

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (install-sum-deriv)
  ;;Internal
  (define (=number? a b)
    (if (and (number? a) (number? b))
      (eq? a b)
      false))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))
  (define (addend s) (car s))
  (define (augend s) (cdr s))
  ;;Interface
  (put 'deriv '+
    (lambda (operands var)
      (make-sum (deriv (addend operands) var)
                (deriv (augend operands) var))))
  'done)