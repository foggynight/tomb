(in-package :tomb)

(defun draw-depth-indicator-label (depth-window)
  (crt:add depth-window "Depth:" :y 0 :x 0))

(defun draw-initial-ui (note-window stat-window depth-window)
  (draw-depth-indicator-label depth-window)
  (mapcar #'crt:refresh (list note-window stat-window depth-window)))

(defun draw-game-view (game-window level)
  (crt:clear game-window)

  ;; Draw tiles
  (let* ((tiles (level-tiles level))
         (row-width (array-dimension tiles 1)))
    (dotimes (row-index (array-dimension tiles 0))
      (dotimes (cell-index row-width)
        (crt:add game-window (tile-symbol (aref tiles row-index cell-index)))
        (crt:move game-window 1 (- row-width) :relative t))))

  ;; Draw entities
  (let ((entities (level-entities level)))
    (dolist (entity entities)
      (crt:add game-window (entity-symbol entity) :y (entity-y entity)
                                                  :x (entity-x entity))))

  (crt:refresh game-window))
