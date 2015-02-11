#lang racket

(define (go)
  'yep-it-works)

(define (serve port-no)
  (define main-cust (make-custodian))
  (parameterize ([current-custodian main-cust])
    (define listener (tcp-listen port-no 5 #t))
    (define (loop)
      (accept-and-handle listener)
      (loop))
    (thread loop))
  (lambda ()
    (custodian-shutdown-all main-cust)))

(define (accept-and-handle listener)
  (define cust (make-custodian))
  (parameterize ([current-custodian cust])
    (define-values (in out) (tcp-accept listener))
    (thread
     (lambda ()
       (sleep 3)
       (handle in out)
       (close-input-port in)
       (close-output-port out))))
  (thread (lambda ()
	    (sleep 10)
	    (custodian-shutdown-all cust))))

(define (handle in out)
  (regexp-match #rx"(\r\n|^)\r\n" in)
  (display "HTTP/1.0 200 Okey\r\n" out)
  (display "Server: k\r\nContent-Type: text:html\r\n\r\n" out)
  (let [(num-str (format "~a" (current-seconds)))]
    (display
     (string-append
      "<html><body>Hello, world![" num-str "]</body></html>")
     out)))
