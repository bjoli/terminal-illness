#lang racket/base
(provide (all-defined-out))
; to use with any r5rs implementation just comment the lines above and use as-is
; To use with whateve r6rs or r7rs system you prefer, consult their documentation

;Convenience functions so that you don't have to string-append (green "OK?") (space) (red "NO!")
(define (space) " ")
(define (blot . args)
  (map display args) (values))

(define (blotln . args)
  (map display args)
  (newline) (values))

(define (blotlns . args)
  (map (lambda (s) (display s) (newline)) args) (values))

; define for use within the macros
(define default-style (make-parameter "\x1b[0m"))

(define-syntax define-style
  (syntax-rules ()
    ((_ name definition)
     (define (name . args)
       (cond
         [(= (length args) 0) (default-style definition) definition]
         [else (string-append definition (car args) (default-style))])))))

;Forground colours
(define-style black   "\x1b[30m")
(define-style red     "\x1b[31m")
(define-style green   "\x1b[32m")
(define-style yellow  "\x1b[33m")
(define-style blue    "\x1b[34m")
(define-style magenta "\x1b[35m")
(define-style cyan    "\x1b[36m")
(define-style white   "\x1b[37m")

;Background colours
(define-style bg-black   "\x1b[40m")
(define-style bg-red     "\x1b[41m")
(define-style bg-green   "\x1b[42m")
(define-style bg-yellow  "\x1b[43m")
(define-style bg-blue    "\x1b[44m")
(define-style bg-magenta "\x1b[45m")
(define-style bg-cyan    "\x1b[46m")
(define-style bg-white   "\x1b[47m")



;Text styles. These behave differently than the ones above

; Bold. There is no way to un-bold without resetting all other formatting
(define (bold . args)
  (cond
    [(= (length args) 0) "\x1b[1m"]
    [else (string-append "\x1b[1m" (car args) "\x1b[0m")]))
(define (stop-bold) "\x1b[0m")
; Boring underline stuff.
(define (underline . args) 
  (cond
    [(= (length args) 0) "\x1b[4m"]
    [else (string-append "\x1b[4m" (car args) "\x1b[24m")]))

(define (stop-underline)  "\x1b[24m")

; Clear screen
(define (clear) "\x1b[3;J\x1b[H\x1b[2J")
(define (display-clear) (display (clear)))

(define (reset) "\x1b[0m")
(define (display-reset) (display (reset)))
