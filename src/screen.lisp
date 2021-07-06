(in-package :tomb)

(require :croatoan)

(defun get-char (sym)
  (case sym
    ('nil #\.)))

(defun draw-level (win level)
  (crt:clear win)
  (dotimes (row-index (array-dimension level 0))
    (dotimes (cell-index (array-dimension level 1))
      (crt:add win (get-char (aref level row-index cell-index))))))
