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

(defmethod move ((obj entity) direction &optional (n 1))
  "Move an entity in the direction specified by the direction keyword.

Optionally, an argument may be passed for n, which represents the number of
cells to move the cursor; the default is one."
  (flet ((multiply (x) (* n x)))
    (let* ((dir (crt:get-direction direction))
           (offset (if (> n 1)
                       (mapcar #'multiply dir)
                       dir)))
      (setf (entity-y obj) (+ (entity-y obj) (car offset)))
      (setf (entity-x obj) (+ (entity-x obj) (cadr offset))))))

(defmethod attempt-move ((obj entity) level direction &optional (n 1))
  "Attempt to move an entity using the move method.

If the entity is unable to move as directed, it will not be moved and this
function returns nil, otherwise it is moved and this function returns non-nil."
  (flet ((multiply (x) (* n x)))
    (let* ((dir (crt:get-direction direction))
           (offset (if (> n 1)
                       (mapcar #'multiply dir)
                       dir))
           (target-pos (list (+ (entity-y obj) (car offset))
                             (+ (entity-x obj) (cadr offset)))))
      (unless (position-out-of-bounds-p level (car target-pos) (cadr target-pos))
        (move obj direction n)))))

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
