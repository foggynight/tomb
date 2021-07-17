(in-package :tomb)

;; TODO Use a struct instead of a list to represent worlds

(defun make-world ()
  "Make a new world."
  (list nil -1))

(defun get-levels (world)
  "Get the levels contained within a world."
  (car world))

(defun set-levels (world levels)
  "Set the levels contained within a world."
  (setf (car world) levels))

(defun get-current-level-index (world)
  "Get the current level index of a world."
  (cadr world))

(defun set-current-level-index (world index)
  "Set the current level index of a world."
  (setf (cadr world) index))

(defun generate-world (filenames)
  "Generate a world containing levels which are each constructed using a file
named in the list of filenames passed as an argument to this function."
  (let ((world (make-world))
        (level-list (loop for filename in filenames
                          collect (read-level-from-file filename))))
    (set-levels world level-list)
    world))

(defun get-level-count (world)
  "Get the number of levels contained within a world."
  (length (get-levels world)))

(defun get-level-n (world n)
  "Get the nth level of a world."
  (car (nthcdr n (get-levels world))))

(defun get-current-level (world)
  "Get the current level of a world."
  (get-level-n world (cadr world)))

(defun cons-entity (entity level)
  "Cons an entity to the front of the entity list of a level."
  (setf (level-entities level) (cons entity (level-entities level))))

(defun remove-entity (entity level &optional (n 1))
  "Remove first n entities equal to the entity argument from the entity list of
a level."
  (setf (level-entities level) (remove entity (level-entities level) :count n)))

(defun move-to-first-level (world player)
  "Move a player to the first level contained within a world.

This function does not remove the player from the current level before switching
levels, thus it should only be called at the start of the program."
  (set-current-level-index world 0)
  (cons-entity player (get-current-level world))
  (get-current-level world))

(defun move-to-next-level (world player)
  "Move a player to the next level contained within a world, wraps around the
end of the list of worlds, returns the new current level."
  (remove-entity player (get-current-level world))
  (set-current-level-index world (mod (1+ (get-current-level-index world))
                                      (get-level-count world)))
  (cons-entity player (get-current-level world))
  (get-current-level world))

(defun move-to-previous-level (world player)
  "Move a player to the previous level contained within a world, wraps around
the beginning of the list of worlds, returns the new current level."
  (remove-entity player (get-current-level world))
  (set-current-level-index world (mod (1- (get-current-level-index world))
                                      (get-level-count world)))
  (cons-entity player (get-current-level world))
  (get-current-level world))
