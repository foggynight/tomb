(in-package :tomb)

(defun draw-level (win level)
  (crt:clear win)

  ;; Draw tiles
  (let* ((tiles (level-tiles level))
         (row-width (array-dimension tiles 1)))
    (dotimes (row-index (array-dimension tiles 0))
      (dotimes (cell-index row-width)
        (crt:add win (tile-symbol (aref tiles row-index cell-index)))
        (crt:move win 1 (- row-width) :relative t))))

  ;; Draw entities
  (let ((entities (level-entities level)))
    (dolist (entity entities)
      (crt:add win (entity-symbol entity) :y (entity-y entity)
                                          :x (entity-x entity))))

  (crt:refresh win))
