(in-package :tomb)

(defun draw-level (win level)
  (crt:clear win)

  ;; Draw tiles
  (let* ((tiles (get-tiles level))
         (row-width (array-dimension tiles 1)))
    (dotimes (row-index (array-dimension tiles 0))
      (dotimes (cell-index row-width)
        (crt:add win (get-char (aref tiles row-index cell-index)))
        (crt:move win 1 (- row-width) :relative t))))

  ;; Draw entities
  (let ((entities (get-entities level)))
    (dolist (entity entities)
      (crt:add win (sym entity) :y (y entity)
                                :x (x entity))))

  (crt:refresh win))