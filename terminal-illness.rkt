#lang racket/base
(provide (all-defined-out))


; Convenience functions so that you don't have to string-append (green "OK?") (space) (red "NO!")
(define (space) " ")
(define (blot . args)
  (for ([s args])
    (display s)))

(define (blotln . args)
  (for ([s args])
    (display s))
  (newline))

(define (blotlns . args)
  (for ([s args])
    (displayln s)))


; define for use within the macros
(define default-style (make-parameter "\e[0m"))

(require (for-syntax racket/base))
(define-syntax (define-style stx)
  (syntax-case stx ()
    [(_ name definition)
     #'(define (name (str ""))
         (cond
           [(string=? str "") (default-style definition) definition]
           [else (string-append definition str (default-style))]))]))

;Forground colours
(define-style black "\e[30m")
(define-style red "\e[31m")
(define-style green "\e[32m")
(define-style yellow "\e[33m")
(define-style blue "\e[34m")
(define-style magenta "\e[35m")
(define-style cyan "\e[36m")
(define-style white "\e[37m")

;Background colours
(define-style bg-black "\e[40m")
(define-style bg-red "\e[41m")
(define-style bg-green "\e[42m")
(define-style bg-yellow "\e[43m")
(define-style bg-blue "\e[44m")
(define-style bg-magenta "\e[45m")
(define-style bg-cyan "\e[46m")
(define-style bg-white "\e[47m")



;Text styles. These behave differently than the ones above

; Bold. There is no way to un-bold without resetting all other formatting
(define (bold str) (string-append "\e[1m" str "\e[0m"))
(define (start-bold) "\e[1m")
(define (stop-bold) "\e[0m")
(define (display-bold str) (display (bold str)))
(define (displayln-bold str) (display-bold str) (newline))

; Boring underline stuff. 
(define (underline str) (string-append "\e[4m" str "\e24m"))
(define (display-underline str) (display (underline str)))
(define (displayln-underline str) (display (underline str))(newline))
(define (start-underline) "\e[4m")
(define (stop-underline)  "\e[24m")

; Clear screen
(define (clear) "\e[3;J\e[H\e[2J")
(define (display-clear) (display (clear)))

(define (reset) "\e[0m")
(define (display-reset) (display (reset)))
