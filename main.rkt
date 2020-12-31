#lang racket
;; trying out 'Deploying Racket applications on Heroku' by ALEXIS KING
;; https://lexi-lambda.github.io/blog/2015/08/22/deploying-racket-applications-on-heroku/

(require web-server/servlet
         web-server/servlet-env)

(define (start req)
  (response/xexpr
   '(html (head (title "Racket Heroku App"))
          (body (h1 "It works!")))))

(define port (if (getenv "PORT")
                 (string->number (getenv "PORT"))
                 8080))
                 
(serve/servlet start
               #:servlet-path "/"
               #:listen-ip #f
               #:port port
               #:command-line? #t)
               
