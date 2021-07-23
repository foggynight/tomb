(in-package :tomb)

(defun draw-depth-indicator-label (depth-win)
  "Draw the 'Depth:' label of the depth indicator window."
  (crt:add depth-win "Depth:" :y 0 :x 0)
  (crt:refresh depth-win))

(defun draw-depth-indicator (depth-win current-level-index)
  "Draw the depth of the player (the current level index) in the depth indicator
window."
  (crt:add depth-win
           (write-to-string current-level-index)
           :y 0 :x 7)
  (crt:refresh depth-win))

(defun draw-initial-ui (world scr note-win stat-win depth-win)
  "Draw the initial UI, not including the game view."
  (crt:refresh scr)  ; The screen must be refreshed before drawing in the child
                     ; windows, unsure if this is a bug in the croatoan library,
                     ; or just how ncurses works.
  (draw-depth-indicator-label depth-win)
  (draw-depth-indicator depth-win (world-current-level-index world))
  (mapcar #'crt:refresh (list note-win stat-win depth-win)))

(defun draw-game-view (game-win level)
  "Draw the game view, that is, the tiles and entities composing a given level,
in the game view window."
  (crt:clear game-win)

  ;; Draw tiles
  (let* ((tiles (level-tiles level))
         (row-width (array-dimension tiles 1)))
    (dotimes (row-index (array-dimension tiles 0))
      (dotimes (cell-index row-width)
        (crt:add game-win (tile-symbol (aref tiles row-index cell-index)))
        (crt:move game-win 1 (- row-width) :relative t))))

  ;; Draw entities
  (let ((entities (level-entities level)))
    (dolist (entity entities)
      (crt:add game-win (entity-symbol entity) :y (entity-y entity)
                                               :x (entity-x entity))))

  (crt:refresh game-win))
