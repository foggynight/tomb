(in-package :tomb)

(defun init-level (&key (h 32) (w 32))
  (make-array (list h w) :initial-element nil))
