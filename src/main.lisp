(in-package :tomb)

(require :croatoan)

(defun main ()
  (let ((level (init-level)))
    (crt:with-screen (scr :cursor-visible nil
                          :input-echoing nil
                          :process-control-chars nil)
      (crt:with-window (win :dimensions '(16 32)
                            :position '(0 0))
        (draw-level win level)
        (crt:refresh win)

        (crt:bind win #\ 'crt:exit-event-loop)

        (crt:run-event-loop win)))))
