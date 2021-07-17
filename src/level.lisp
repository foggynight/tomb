(in-package :tomb)

(defstruct level
  tiles      ;; Grid of tiles which compose the level
  entities)  ;; List of entities contained within the level

(defun string-to-tile-vector (string)
  "Convert a string to a vector of tiles."
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

(defun read-level-from-file (filename)
  "Make a level using the contents of the named file."
  (make-level :tiles (read-tiles-from-file filename)))
