(in-package :tomb)

(defstruct level
  "Level structure representing a level in a world.

Levels contain a grid of tiles which compose the space contained within the
level, and a list of entities which occupy tiles in the level."
  tiles
  entities)

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

(defun get-entity (level y x)
  "Get the entity located at the y-x position in the tile grid of a level,
returns nil if no entity is found."
  (car (member-if (lambda (e) (and (= (entity-y e) y)
                                   (= (entity-x e) x)))
                  (level-entities level))))

(defun position-out-of-bounds-p (level y x)
  "Determine if a position is out of bounds of a level's tile grid."
  (or (< y 0)
      (< x 0)
      (>= y (array-dimension (level-tiles level) 0))
      (>= x (array-dimension (level-tiles level) 1))))

(defun tile-has-floor-p (level y x)
  "Determine if the tile at the y-x position in the tile grid of a level
has a floor."
  t
  )

(defun tile-has-wall-p (level y x)
  "Determine if the tile at the y-x position in the tile grid of a level
has a wall."
  nil
  )

(defun tile-can-be-moved-to (level y x)
  "Determine if the tile at the y-x position in the tile grid of a level can be
moved to by an entity.

That is, does it contain a floor, and is it unobstructed (by a wall etc)."
  (and (tile-has-floor-p level y x)
       (not (tile-has-wall-p level y x))))
