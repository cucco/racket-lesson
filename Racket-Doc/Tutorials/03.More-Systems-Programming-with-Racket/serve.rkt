#lang racket

(define (go)
  'yep-it-works)

(define (serve port-no)
  (define listener (tcp-listen port-no 5 #t))
  (define (loop)
    (accept-and-handle listener)
    (loop))
  (define t (thread loop))
  (lambda ()
    (kill-thread t)
    (tcp-close listener)))

(define (accept-and-handle listener)
  (define-values (in out) (tcp-accept listener))
  (sleep 5)
  (handle in out)
  (close-input-port in)
  (close-output-port out))

(define (handle in out)
  (regexp-match #rx"(\r\n|^)\r\n" in)
  (display "HTTP/1.0 200 Okey\r\n" out)
  (display "Server: k\r\nContent-Type: text:html\r\n\r\n" out)
  (let [(num-str (format "~a" (current-seconds)))]
    (display
     (string-append
      "<html><body>Hello, world![" num-str "]</body></html>")
     out)))
