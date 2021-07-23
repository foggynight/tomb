(in-package :tomb)

(defun main ()
  (let* ((world (generate-world '("res/test-0.lvl"
                                  "res/test-1.lvl")))
         (player (make-player :y 1 :x 1))
         (level (move-to-first-level world player)))
    (crt:with-screen (scr :cursor-visible nil
                          :input-echoing nil
                          :process-control-chars nil)
      (crt:with-windows ((note-window
                          :background (make-instance 'crt:complex-char
                                                     :simple-char #\N)
                          :dimensions '(1 80)
                          :position '(0 0))
                         (game-window
                          :dimensions '(22 80)
                          :position '(1 0))
                         (stat-window
                          :background (make-instance 'crt:complex-char
                                                     :simple-char #\S)
                          :dimensions '(1 71)
                          :position '(23 0))
                         (depth-window
                          :background (make-instance 'crt:complex-char
                                                     :simple-char #\D)
                          :dimensions '(1 8)
                          :position '(23 72)))
        (crt:bind game-window #\ 'crt:exit-event-loop)
        (macrolet ((bind (key direction)
                     `(crt:bind game-window ,key
                                (lambda (w e)
                                  (declare (ignore w e))
                                  (attempt-move player level ,direction)
                                  (draw-game-view game-window level)))))
          (bind #\h :left)
          (bind #\j :down)
          (bind #\k :up)
          (bind #\l :right))
        (crt:bind game-window #\>
                  (lambda (w e)
                    (declare (ignore w e))
                    (when (level-tile-is-stairs-p level
                                                  (entity-y player)
                                                  (entity-x player))
                      (setq level (move-to-next-level world player))
                      (draw-game-view game-window level))))
        (draw-initial-ui note-window
                         stat-window
                         depth-window)
        (draw-game-view game-window level)
        (crt:run-event-loop game-window)))))
