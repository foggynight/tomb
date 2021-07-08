(in-package :tomb)

(defun make-tile (&key (tile-char #\space))
  "Make a new tile."
  (list tile-char))

(defun get-char (tile)
  "Get the character used to represent a tile on-screen."
  (car tile))

(defun set-char (tile char)
  "Set the character used to represent a tile on-screen."
  (setf (car tile) char))
