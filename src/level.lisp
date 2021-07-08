(in-package :tomb)

(defun make-level ()
  "Make a new level."
  (list nil nil))

(defun get-tiles (level)
  "Get the tiles composing a level."
  (car level))

(defun set-tiles (level tiles)
  "Set the tiles composing a level."
  (setf (car level) tiles))

(defun get-entities (level)
  "Get the entities contained within a level."
  (cadr level))

(defun set-entities (level entities)
  "Set the entities contained within a level."
  (setf (cadr level) entities))

(defun string-to-tile-vector (string)
  "Convert a string to a vector of tiles."
  (let ((tile-list (loop for char across string
                         collect (make-tile :tile-char char))))
    (make-array (length tile-list) :initial-contents tile-list)))

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

(defun read-level-from-file (filename)
  "Make a level using the contents of the named file."
  (let ((level (make-level)))
    (set-tiles level (read-tiles-from-file filename))
    level))
