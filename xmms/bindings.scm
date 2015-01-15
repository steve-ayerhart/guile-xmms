(define-module (xmms bindings)
  #:use-module (system foreign))

(define libxmmsclient (dynamic-link "libxmmsclient"))

; client
(define-xmms '* xmmsc_init '(*))
(define-xmms int xmmsc_connect '(* *))
(define-xmms '* xmmsc_quit '(*))
(define-xmms '* xmmsc_get_last_error '(*))

; result
(define-xmms int xmmsc_result_get_class '(*))

; playback
(define-xmms '* xmmsc_playback_tickle '(*))
(define-xmms '* xmmsc_playback_stop '(*))
(define-xmms '* xmmsc_playback_pause'(*))
(define-xmms '* xmmsc_playback_start '(*))
(define-xmms '* xmmsc_playback_seek_ms_abs '(* int))
(define-xmms '* xmmsc_playback_seek_ms_rel '(* int))
(define-xmms '* xmmsc_playback_seek_ms '(* int *))
(define-xmms '* xmmsc_playback_seek_samples_abs '(* int))
(define-xmms '* xmmsc_playback_seek_samples_rel'(* int))
(define-xmms '* xmmsc_playback_seek_samples '(* int *))
(define-xmms '* xmmsc_playback_status'(*))
(define-xmms '* xmmsc_playback_current_id'(*))
(define-xmms '* xmmsc_playback_playtime_playtime'(*))
(define-xmms '* xmmsc_playback_playtime'(*))
(define-xmms '* xmmsc_playback_volume_set'(* * int))
(define-xmms '* xmmsc_playback_volume_get'(*))
(define-xmms '* xmmsc_broadcast_playback_volume_changed '(*))
