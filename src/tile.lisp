(in-package #:tomb)

(defparameter *tile-symbol-type-alist*
  '((#\.     . floor)
    (#\%     . stairs)
    (#\space . void)
    (#\#     . wall))
  "Alist of tile symbol and type pairs.")

(defstruct tile
  "Tile structure representing a tile in a world; tiles are a single cell of
space in a world, and are the smallest amount of space which an entity can
occupy.

Tiles have a position which is inferred from their position in their containing
data structure, a symbol used to represent the tile on-screen, and a type which
is inferred from the symbol that determines how the tile interacts with objects
in a world."
  symbol)

(defun string-to-tile-vector (string)
  "Convert a string into a vector of tiles."
  (let ((tile-list (loop for char across string
                         collect (make-tile :symbol char))))
    (make-array (length tile-list) :initial-contents tile-list)))

;; TODO Remove constraint: strings must be of same length. I think I will go
;; about this by padding the ends of shorter strings with spaces to the length
;; of the longest string before converting the list of strings to an array.
(defun string-list-to-tile-array2 (string-list)
  "Convert a list of strings into a 2D array of tiles, strings must all be the
same length, returns nil when string-list is empty."
  (if (endp string-list)
      nil
      (let ((vector-list nil))
        (dolist (string string-list)
          (setq vector-list (cons (string-to-tile-vector string)
                                  vector-list)))
        (make-array (list (length vector-list)
                          (length (car vector-list)))
                    :initial-contents (reverse vector-list)))))

(defun read-tiles-from-file (filename)
  "Convert the contents of a file into a 2D array of tiles."
  (with-open-file (stream filename :if-does-not-exist nil)
    (let ((string-list (loop for line = (read-line stream nil)
                             while line
                             collect line)))
      (string-list-to-tile-array2 string-list))))

(defun tile-type (tile)
  "Get the type of a tile based on its symbol, the type is represented by an
atomic symbol naming the type."
  (cdr (assoc (tile-symbol tile) *tile-symbol-type-alist*)))

;; TODO Use macro to define predicate functions for each tile type

(defun tile-is-floor-p (tile)
  (eq (tile-type tile) 'floor))

(defun tile-is-stairs-p (tile)
  (eq (tile-type tile) 'stairs))
