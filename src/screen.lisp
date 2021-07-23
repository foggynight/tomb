(in-package :tomb)

(defun draw-depth-indicator-label (depth-window)
  "Draw the 'Depth:' label of the depth indicator window."
  (crt:add depth-window "Depth:" :y 0 :x 0))

(defun draw-depth-indicator (depth-window current-level-index)
  "Draw the depth of the player (the current level index) in the depth indicator
window."
  (crt:add depth-window
           (write-to-string current-level-index)
           :y 0 :x 7)
  (crt:refresh depth-window))

(defun draw-initial-ui (world note-window stat-window depth-window)
  "Draw the initial UI."
  (draw-depth-indicator-label depth-window)
  (draw-depth-indicator depth-window (world-current-level-index world))
  (mapcar #'crt:refresh (list note-window stat-window depth-window)))

(defun draw-game-view (game-window level)
  "Draw the game view, that is, the tiles and entities composing a given level,
in the game view window."
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
