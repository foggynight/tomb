(in-package :tomb)

(defclass entity ()
  ((y
    :accessor y
    :initarg :y
    :initform 0
    :documentation
    "y position of this entity -- index of the row which contains this entity.")
   (x
    :accessor x
    :initarg :x
    :initform 0
    :documentation
    "x position of this entity -- index of the cell in its containing row which
contains this entity.")
   (sym
    :accessor sym
    :initarg :sym
    :initform #\space
    :documentation
    "Symbol used to represent the entity on-screen."))
  (:documentation
   "Entity class representing a being in the world that can move and collides
with objects in the world.

This is the base class for the various entity types in the game."))

(defmethod move ((obj entity) direction &optional (n 1))
  "Move an entity in the direction specified by the direction keyword.

Optionally, an argument may be passed for n, which represents the number of
cells to move the cursor; the default is one."
  (flet ((multiply (x) (* n x)))
    (let* ((dir (crt:get-direction direction))
           (offset (if (> n 1)
                       (mapcar #'multiply dir)
                       dir)))
      (setf (y obj) (+ (y obj) (car offset)))
      (setf (x obj) (+ (x obj) (cadr offset))))))

(defclass player (entity)
  ()
  (:documentation
   "Player class representing the player's character in a level, player is a
child class of entity."))

(defun make-player (&key (y 0) (x 0) (sym #\@))
  "Make a new player."
  (make-instance 'player :y y :x x :sym sym))

(defclass enemy (entity)
  ()
  (:documentation
   "Enemy class representing each of the enemies in a level, enemy is a child
class of entity."))
