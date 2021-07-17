(in-package :tomb)

(defstruct world
  "World structure representing a game world divided into levels.

Worlds contain a list of levels, as well the index of the level currently
containing the player."
  levels
  current-level-index)

(defun generate-world (filenames)
  "Generate a world containing levels which are each constructed using a file
named in the list of filenames passed as an argument to this function."
  (let ((world (make-world))
        (level-list (loop for filename in filenames
                          collect (read-level-from-file filename))))
    (setf (world-levels world) level-list)
    world))

(defun world-level-count (world)
  "Get the number of levels contained within a world."
  (length (world-levels world)))

(defun world-level-n (world n)
  "Get the nth level of a world."
  (car (nthcdr n (world-levels world))))

(defun world-current-level (world)
  "Get the current level of a world."
  (world-level-n world (world-current-level-index world)))

(defun move-to-first-level (world player)
  "Move a player to the first level contained within a world, returns the new
current level.

This function does not remove the player from the current level before switching
levels, thus it should only be called at the start of the program."
  (setf (world-current-level-index world) 0)
  (add-entity player (world-current-level world))
  (world-current-level world))

(defun move-to-next-level (world player)
  "Move a player to the next level contained within a world, wraps around the
end of the list of worlds, returns the new current level."
  (remove-entity player (world-current-level world))
  (setf (world-current-level-index world)
        (mod (1+ (get-current-level-index world))
             (get-level-count world)))
  (add-entity player (world-current-level world))
  (world-current-level world))

(defun move-to-previous-level (world player)
  "Move a player to the previous level contained within a world, wraps around
the beginning of the list of worlds, returns the new current level."
  (remove-entity player (world-current-level world))
  (setf (world-current-level-index world)
        (mod (1- (get-current-level-index world))
             (get-level-count world)))
  (add-entity player (world-current-level world))
  (world-current-level world))
