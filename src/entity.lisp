(in-package :tomb)

(defclass entity ()
  ((y
    :accessor entity-y
    :initarg :y
    :initform 0
    :documentation
    "y position of this entity -- index of the row which contains this entity.")
   (x
    :accessor entity-x
    :initarg :x
    :initform 0
    :documentation
    "x position of this entity -- index of the cell in its containing row which
contains this entity.")
   (symbol
    :accessor entity-symbol
    :initarg :symbol
    :initform #\space
    :documentation
    "Symbol used to represent this entity on-screen."))
  (:documentation
   "Entity class representing a being in the world that can move and collides
with objects in the world.

This is the base class for the various entity types in the game."))

(defmethod move ((obj entity) direction)
  "Move an entity in the direction specified by the direction keyword."
  (let* ((dir (crt:get-direction direction)))
    (setf (entity-y obj) (+ (entity-y obj) (car dir)))
    (setf (entity-x obj) (+ (entity-x obj) (cadr dir)))))

(defmethod attack ((obj entity) (target entity))
  "Direct an entity to attack another entity."

  )

(defmethod attempt-move ((obj entity) level direction)
  "Attempt to move an entity. If the target position can be moved to, check if
it contains another entity and attack the entity if so, otherwise move to the
target position."
  (let* ((dir (crt:get-direction direction))
         (y (+ (entity-y obj) (car dir)))
         (x (+ (entity-x obj) (cadr dir))))
    (unless (or (position-out-of-bounds-p level y x)
                (not (tile-can-be-moved-to-p level y x)))
      (let ((target-entity (get-entity level y x)))
        (if target-entity
            (attack obj target-entity)
            (move obj direction))))))

(defclass player (entity)
  ()
  (:documentation
   "Player class representing the player's character in the world, player is a
child class of entity."))

(defun make-player (&key (y 0) (x 0) (symbol #\@))
  "Make a new player."
  (make-instance 'player :y y :x x :symbol symbol))

(defclass enemy (entity)
  ()
  (:documentation
   "Enemy class representing each of the enemies in the world, enemy is a child
class of entity."))
