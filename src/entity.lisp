(in-package :tomb)

(defclass entity ()
  ((pos
    :accessor entity-pos
    :initarg :pos
    :initform '(0 . 0)
    :type cons
    :documentation
    "Position of this entity represented by a cons pair.")
   (stats
    :accessor entity-stats
    :initarg :stats
    :initform nil
    :type list
    :documentation
    "List of this entity's stats."))
   (symbol
    :accessor entity-symbol
    :initarg :symbol
    :initform #\space
    :type standard-char
    :documentation
    "Symbol used to represent this entity on-screen.")
  (:documentation
   "Entity class representing a being that can move through the world. This is
the base class for the various entity types in the game."))

(defmethod entity-y ((obj entity))
  (car (entity-pos obj)))

(defmethod entity-x ((obj entity))
  (cdr (entity-pos obj)))

;; TODO Define setf methods for entity-y and entity-x

(defmethod move ((obj entity) direction)
  "Direct an entity to move in the direction specified by the direction
keyword."
  (let* ((dir (crt:get-direction direction)))
    (setf (entity-pos obj) (cons (+ (entity-y obj) (car dir))
                                 (+ (entity-x obj) (cadr dir))))))

(defmethod attack ((obj entity) (target entity))
  "Direct an entity to attack another entity."

  )

(defmethod attempt-move ((obj entity) level direction)
  "Direct an entity to attempt to move using the following logic: if the target
position can be moved to, check if it contains another entity and attack the
entity if so, otherwise move to the target position."
  (let* ((dir (crt:get-direction direction))
         (target-y (+ (entity-y obj) (car dir)))
         (target-x (+ (entity-x obj) (cadr dir))))
    (unless (or (position-out-of-bounds-p level target-y target-x)
                (not (level-tile-can-be-moved-to-p level target-y target-x)))
      (let ((target-entity (get-entity level target-y target-x)))
        (if target-entity
            (attack obj target-entity)
            (move obj direction))))))

(defclass player (entity) ()
  (:documentation
   "Player class representing the player's character in the world, player is a
child class of entity."))

(defun make-player (&key (y nil) (x nil) (pos nil) (symbol #\@))
  "Make a new player object."
  (if (and y x)
      (make-instance 'player :pos (cons y x) :symbol symbol)
      (make-instance 'player :pos pos :symbol symbol)))

(defclass enemy (entity) ()
  (:documentation
   "Enemy class representing each of the enemies in the world, enemy is a child
class of entity."))
