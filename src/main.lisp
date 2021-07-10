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
        (draw-level win level)
        (crt:refresh win)

        (crt:bind win #\ 'crt:exit-event-loop)

        (crt:bind win #\n (lambda (w e)
                            (declare (ignore w e))
                            (setq level (move-to-next-level world player))
                            (draw-level win level)
                            (crt:refresh win)))

        (crt:bind win #\p (lambda (w e)
                            (declare (ignore w e))
                            (setq level (move-to-previous-level world player))
                            (draw-level win level)
                            (crt:refresh win)))

        (crt:run-event-loop win)))))

;; This is temporary, allows the program to be compiled and the main function
;; executed directly on load, removing the need to execute the main function
;; after executing the quickload.sh script (which is also temporary).
(main)
