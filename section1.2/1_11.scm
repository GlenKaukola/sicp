(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (f2 n)
  (define (iter n1 n2 n3 count)
    (cond ((< count 3) n3) 
          (else (iter n2 n3  (+ (* 3 n1) (* 2 n2) n3) (- count 1)))))
  (cond ((< n 3) n)
        (else (iter 0 1 2 n))))
