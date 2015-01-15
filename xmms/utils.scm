(define-module (xmms utils)
  #:use-module (system foreign)
  #:use-module (ice-9 list))
  
(define-syntax define-xmms
  (lambda (stx)
    (syntax-case stx ()
      ((_ return name args doc-string) 
       (with-syntax ((c-name (datum->syntax stx (symbol->string (syntax->datum #'name))))
                     (scm-name (datum->syntax stx (string->symbol
                                                   (regexp-substitute/global #f
                                                                             "[_]"
                                                                             (symbol->string (syntax->datum #'name))
                                                                             'pre
                                                                             "-"
                                                                             'post)))))
        #`(define-public scm-name
            (lambda (ar
            (pointer->procedure return (dynamic-func c-name libxmmsclient) args)))))))

(define-syntax-rule (define-enumeration enumerator (name value) ...)
  (define-syntax enumerator
    (lambda (x)
      (syntax-case x ()
        ((_)
         #''(name ...))
        ((_ enum) (number? (syntax->datum #'enum))
         (symbol->string (car (or (rassoc (syntax->datum #'enum)
                                          '((name . value) ...))
                                  (syntax-violation 'enumerator "invalid enumerated value"
                                                    #'enum)))))
        ((_ enum)
         (or (assq-ref '((name . value) ...)
                       (syntax->datum #'enum))
             (syntax-violation 'enumerator "invalid enumerated value"
                               #'enum)))))))

(define-wrapped-pointer-type xmms-result
  xmms-result? wrap-xmms-result unwrap-xmms-result
  (lambda (result p)
    (format p "#<xmms-result ~a ~x>" "test" (pointer-address unwrap-xmms-result))))

(define-wrapped-pointer-type xmms-connection
  xmms-connection? wrap-xmms-connection unwrap-xmms-connection
  (lambda (connection p)
    (format p "#<xmms-connection ~a ~x>" "test" (pointer-address (unwrap-xmms-connection connection)))))

(define (boolean->number true?)
  "Return 1 if true? is #t, 0 otherwise"
  (if true? 1 0))

(define (one? n)
  "Return #t if N is equal to 1, #f otherwise."
  (= n 1))

(define (number->boolean num)
  (if (eq? 1 num) #t #f))
