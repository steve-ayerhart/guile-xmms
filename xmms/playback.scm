(define-module (xmms playback)
  #:use-module (system foreign)
  #:use-module ((xmms bindings)
                #:prefix %
                #:select ((xmmsc-playback-tickle
                                 xmmsc-playback-stop
                                 xmmsc-playback-pause
                                 xmmsc-playback-start
                                 xmmsc-playback-seek-ms-abs
                                 xmmsc-playback-seek-ms-rel
                                 xmmsc-playback-seek-ms
                                 xmmsc-playback-seek-samples-abs
                                 xmmsc-playback-seek-samples-rel
                                 xmmsc-playback-samples
                                 xmmsc-playback-status
                                 xmmsc-playback-current-id
                                 xmmsc-playback-playtime-playtime
                                 xmmsc-playback-playtime
                                 xmmsc-playback-volume-set
                                 xmmsc-playback-volume-get
                                 xmmsc-broadcast-playback-volume-changed))))


(define-public (xmms-playback-tickle! xmms-connection)
  "Stop decoding of current song."
  (%xmmsc-playback-tickel (unwrap-xmms-connection xmms-connection)))

(define-public (xmms-playback-stop! xmms-connection)
  "Stops the current playback."
  (%xmmsc-playback-stop (unwrap-xmms-connection xmms-connection))) 

(define-public (xmms-playback-pause! xmms-connection)
  "Pause the current playback, will tell the output to not read nor write."
  (%xmmsc-playback-pause(unwrap-xmms-connection xmms-connection))) 

(define-public (xmms-playback-start! xmms-connection)
  "Starts playback if server is idle."
  (%xmmsc-playback-start (unwrap-xmms-connection xmms-connection))) 

(define-public (xmms-playback-seek-ms-abs! xmms-connection milliseconds)
  "Seek to an absolute time in the current playback."
  (%xmmsc-playback-seek-ms-abs (unwrap-xmms-connection xmms-connection) milliseconds))

(define-public (xmms-playback-seek-ms-rel! xmms-connection milliseconds)
  "Seek to time relative to the current position in the current playback."
  (%xmmsc-playback-seek-ms-rel (unwrap-xmms-connection xmms-connection) miliseconds))

(define-public (xmms-playback-seek-ms! xmms-connection milliseconds whence)
  "Seek to a position given in milisecondsin the current playback."
  (%xmmsc-playback-seek-ms (unwrap-xmms-connection xmms-connection) milliseconds whence))

(define-public (xmms-playback-seek-samples-abs! xmms-connection samples)
  "Seek to an absolute number of samples in the current playback."
  (%xmmsc-playback-seek-samples-abs (unwrap-xmms-connection xmms-connection)))

(define-public (xmms-playback-seek-samples-rel! xmms-connection samples)
  "Seek to a number of samples relative to the current position in the current playback."
  (%xmmsc-playback-seek-samples-rel (unwrap-xmms-connection xmms-connection) samples))

(define-public (xmms-playback-seek-samples! xmms-connection samples whence)
  "Seek to a position given in samples in the current playback."
  (%xmmsc-playback-samples (unwrap-xmms-connection xmms-connection) samples whence))

(define-public (xmms-playback-status xmms-connection)
  "Requests the playback status broadcast."
  (%xmmsc-playback-status(unwrap-xmms-connection xmms-connection)))

(define-public (xmms-playback-current-id xmms-connection)
  "Request the current id broadcast."
  (%xmmsc-playback-current-id (unwrap-xmms-connection xmms-connection)))

(define-public (xmms-playback-playtime-playtime xmms-connection)
  "Request the playback_playtime signal."
  (%xmmsc-playback-playtime-playtime (unwrap-xmms-connection xmms-connection)))

(define-public (xmms-playback-playtime xmms-connection)
  "Make the server emit the current playtime."
  (%xmmsc-playback-playtime(unwrap-xmms-connection xmms-connection)))

(define-public (set-xmms-playback-volume! xmms-connection channel volume)
  "Sets the playback volume"
  (%xmmsc-playback-start (unwrap-xmms-connection xmms-connection)
                         (string->pointer channel)
                         volume))

(define-public (xmms-playback-volume xmms-connection)
  "Get the playback volume"
  (%xmmsc-playback-volume-get (unwrap-xmms-connection xmms-connection)))

(define-public (xmms-broadcast-playback-volume-changed xmms-connection)
  "Make the server emit the playback volume changed signal"
  (%xmmsc-broadcast-playback-volume-changed (unwrap-xmms-connection xmms-connection)))
