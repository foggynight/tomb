(in-package :tomb)

(defun make-world ()
  "Make a new world."
  (list nil))

(defun get-levels (world)
  "Get the levels contained within a world."
  (car world))

(defun set-levels (world levels)
  "Set the levels contained within a world."
  (setf (car world) levels))

(defun generate-world (filenames)
  "Generate a world containing levels which are each constructed using a file
named in the list of filenames passed as an argument to this function."
  (let ((world (make-world))
        (level-list (loop for filename in filenames
                          collect (read-level-from-file filename))))
    (set-levels world level-list)
    world))
