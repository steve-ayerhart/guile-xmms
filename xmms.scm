(define-module (xmms)
  #:use-module (xmms utils)
  #:use-module ((xmms bindings #:prefix %))
  #:use-module (system foreign))

(define-enumeration result-type
  (default 0)
  (signal 1)
  (broadcast 2))

(define* (make-xmms-connection #:optional #:key (client-name "guile-xmms"))
  (let ((xmmsc-connection (%xmmsc-init (string->pointer client-name))))
    (if (null-pointer? xmmsc-connection)
        (error "Failed to make xmms connection")
        (wrap-xmms-connection xmmsc-connection))))


(define* (xmms-connect xmms-connection #:optional #:key (icp-path (getenv "XMMS_PATH")))
  "Connect to the XMMS server"
  (number->boolean (%xmmsc-connect (unwrap-xmms-connection xmms-connection) (string->pointer icp-path))))


