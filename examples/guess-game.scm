;#!../scheme -1
; guess-game.scm
(newline)

(display "Choose any number from 1 to 1000") (newline)
(display "I'll guess it in 10 attempts") (newline)

(let loop ()
    (display "type 'ok' when ready: ")
        (if (eqv? (read) 'ok) #t (loop)))

(newline)

(define (ask-user)
    (let ((ur (read)))
        (cond
            ((eq? ur 'yes) #t)
            ((eq? ur 'no) #f)
            (else (begin (display "please, 'yes' or 'no:") (newline) (ask-user))))))

(define (guess lo hi n)
    (if (= n 11)
        (begin (display "your number is ") (display lo) (newline))
        (let ((mid (exact (floor (/ (+ hi lo) 2)))) (np (+ n 1)))
            (map display (list "Guess#" n " : your number is above " mid "?"))
            (newline)
            (if (ask-user)
                (guess (+ mid 1) hi np)
                (guess lo mid np)))))

(guess 1 1000 1)
