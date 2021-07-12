(in-package :tomb)

(defun main ()
  (let* ((player (make-player))
         (world (generate-world '("res/test-0.lvl"
                                  "res/test-1.lvl"
                                  "res/test-2.lvl")))
         (level (move-to-first-level world player)))
    (crt:with-screen (scr :cursor-visible nil
                          :input-echoing nil
                          :process-control-chars nil)
      (crt:with-window (win :dimensions '(24 80)
                            :position '(0 0))
        (crt:bind win #\ 'crt:exit-event-loop)
        (macrolet ((bind (key direction)
                     `(crt:bind win ,key
                                (lambda (w e)
                                  (declare (ignore w e))
                                  (attempt-move player ,direction)
                                  (draw-level win level)))))
          (bind #\h :left)
          (bind #\j :down)
          (bind #\k :up)
          (bind #\l :right))
        (crt:bind win #\n
                  (lambda (w e)
                    (declare (ignore w e))
                    (setq level (move-to-next-level world player))
                    (draw-level win level)))
        (crt:bind win #\p
                  (lambda (w e)
                    (declare (ignore w e))
                    (setq level (move-to-previous-level world player))
                    (draw-level win level)))
        (draw-level win level)
        (crt:run-event-loop win)))))
