(in-package :tomb)

(defstruct level
  "Level structure representing a level in a world.

Levels contain a grid of tiles which compose the space contained within the
level, and a list of entities which occupy tiles in the level."
  tiles
  entities)

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

(defun add-entity (entity level)
  "Add an entity to the front of the entity list of a level."
  (setf (level-entities level) (cons entity (level-entities level))))

(defun remove-entity (entity level)
  "Remove the first entity from the list of entities of a level which is equal
to the entity argument."
  (setf (level-entities level) (remove entity (level-entities level) :count 1)))
