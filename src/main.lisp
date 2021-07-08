(in-package :tomb)

(require :croatoan)

(defun main ()
  (let* ((world (generate-world '("res/test-0.lvl"
                                  "res/test-1.lvl"
                                  "res/test-2.lvl")))
         (level (get-current-level world)))
    (crt:with-screen (scr :cursor-visible nil
                          :input-echoing nil
                          :process-control-chars nil)
      (crt:with-window (win :dimensions '(16 32)
                            :position '(0 0))
        (draw-level win level)
        (crt:refresh win)

        (crt:bind win #\ 'crt:exit-event-loop)

        (crt:bind win #\n (lambda (w e)
                            (declare (ignore w e))
                            (setq level (move-to-next-level world))
                            (draw-level win level)
                            (crt:refresh win)))

        (crt:bind win #\p (lambda (w e)
                            (declare (ignore w e))
                            (setq level (move-to-previous-level world))
                            (draw-level win level)
                            (crt:refresh win)))

        (crt:run-event-loop win)))))
