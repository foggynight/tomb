(in-package :tomb)

(require :croatoan)

(defun main ()
  (crt:with-screen (scr :input-echoing nil
                        :process-control-chars nil)
    (crt:with-windows ((w0 :dimensions '(8 16) :position '(1 1))
                       (w1 :dimensions '(8 16) :position '(1 18))
                       (w2 :dimensions '(8 16) :position '(1 35)))
      (crt:bind scr #\ 'crt:exit-event-loop)
      (crt:bind scr t (lambda (w e)
                        (declare (ignore w))
                        (let ((win-list (list w0 w1 w2)))
                          (dolist (win win-list)
                            (crt:add win e)
                            (crt:refresh win)))))
      (crt:run-event-loop scr))))
