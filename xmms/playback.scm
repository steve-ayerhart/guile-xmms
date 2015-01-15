(define-module (xmms playback)
  #:use-module ((xmm bindings #:prefix %)))


(define-public (xmms-playback-start xmms-connection)
  ""
  (%xmmsc-playback-start (unwrap-xmms-connection xmms-connection))) 

(define-public (xmms-playback-stop xmms-connection)
  ""
  (%xmmsc-playback-stop (unwrap-xmms-connection xmms-connection))) 
