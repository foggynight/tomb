(in-package :tomb)

(defun main ()
  (let* ((world (generate-world '("res/test-0.lvl"
                                  "res/test-1.lvl")))
         (player (make-player :y 1 :x 1))
         (level (move-to-first-level world player)))
    (add-entity (make-instance 'entity :pos '(3 . 5) :symbol #\Z) level)
    (crt:with-screen (scr :cursor-visible nil
                          :enable-function-keys t
                          :input-echoing nil
                          :process-control-chars nil)
      (crt:with-windows ((note-win
                          :background (make-instance 'crt:complex-char
                                                     :simple-char #\N)
                          :dimensions '(1 80)
                          :position '(0 0))
                         (game-win
                          :dimensions '(22 80)
                          :position '(1 0))
                         (stat-win
                          :background (make-instance 'crt:complex-char
                                                     :simple-char #\S)
                          :dimensions '(1 71)
                          :position '(23 0))
                         (depth-win
                          :dimensions '(1 8)
                          :position '(23 72)))
        (crt:bind scr #\ 'crt:exit-event-loop)
        (macrolet ((bind (keys direction)
                     `(crt:bind scr ,keys
                                (lambda (w e)
                                  (declare (ignore w e))
                                  (attempt-move player level ,direction)
                                  (draw-game-view game-win level)))))
          (bind '(#\h :left) :left)
          (bind '(#\j :down) :down)
          (bind '(#\k :up) :up)
          (bind '(#\l :right) :right))
        (crt:bind scr #\>
                  (lambda (w e)
                    (declare (ignore w e))
                    (when (level-tile-is-stairs-p level
                                                  (entity-y player)
                                                  (entity-x player))
                      (setq level (move-to-next-level world player))
                      (draw-depth-indicator depth-win (world-current-level-index world))
                      (draw-game-view game-win level))))
        (draw-initial-ui world scr note-win stat-win depth-win)
        (draw-game-view game-win level)
        (crt:run-event-loop scr)))))
