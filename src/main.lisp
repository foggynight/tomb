(in-package :tomb)

(defun main ()
  (let* ((world (generate-world '("res/test-0.lvl"
                                  "res/test-1.lvl")))
         (player (make-player :y 1 :x 1))
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
                                  (attempt-move player level ,direction)
                                  (draw-level win level)))))
          (bind #\h :left)
          (bind #\j :down)
          (bind #\k :up)
          (bind #\l :right))
        (crt:bind win #\>
                  (lambda (w e)
                    (declare (ignore w e))
                    (when (level-tile-is-stairs-p level
                                                  (entity-y player)
                                                  (entity-x player))
                      (setq level (move-to-next-level world player))
                      (draw-level win level))))
        (draw-level win level)
        (crt:run-event-loop win)))))
