(in-package :tomb)

(defun make-world ()
  "Make a new world."
  (list nil 0))

(defun get-levels (world)
  "Get the levels contained within a world."
  (car world))

(defun set-levels (world levels)
  "Set the levels contained within a world."
  (setf (car world) levels))

(defun get-level-count (world)
  "Get the number of levels contained within a world."
  (length (get-levels world)))

(defun get-level-n (world n)
  "Get the nth level of a world."
  (car (nthcdr n (get-levels world))))

(defun get-current-level (world)
  "Get the current level of a world."
  (get-level-n world (cadr world)))

(defmacro move-to-next-level (world)
  "Move a world onto its next level (wrapping around the end of the list of
levels), and return the new current level."
  `(progn (setf (cadr ,world) (mod (1+ (cadr ,world)) (get-level-count ,world)))
          (get-current-level ,world)))

(defmacro move-to-previous-level (world)
  "Move a world back to its previous level (wrapping around the beginning of the
list of levels), and return the new current level."
  `(progn (setf (cadr ,world) (mod (1- (cadr ,world)) (get-level-count ,world)))
          (get-current-level ,world)))

(defun generate-world (filenames)
  "Generate a world containing levels which are each constructed using a file
named in the list of filenames passed as an argument to this function."
  (let ((world (make-world))
        (level-list (loop for filename in filenames
                          collect (read-level-from-file filename))))
    (set-levels world level-list)
    world))
