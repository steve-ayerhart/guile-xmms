(define-module (xmms bindings)
  #:use-module (system foreign))

(define libxmmsclient (dynamic-link "libxmmsclient"))

(define-xmms '* xmmsc_init '(*))
(define-xmms int xmmsc_connect '(* *))

(define-xmms '* xmmsc_quit '(*))
(define-xmms '* xmmsc_get_last_error '(*))
(define-xmms '* xmmsc_playback_start '(*))
(define-xmms '* xmmsc_playback_stop '(*))
(define-xmms int xmmsc_result_get_class '(*))
