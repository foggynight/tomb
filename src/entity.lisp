(in-package :tomb)

(defclass entity ()
  ((pos
    :accessor entity-pos
    :initarg :pos
    :initform '(0 . 0)
    :type cons
    :documentation
    "Position of this entity represented by a cons pair.")
   (symbol
    :accessor entity-symbol
    :initarg :symbol
    :initform #\space
    :type standard-char
    :documentation
    "Symbol used to represent this entity on-screen.")
   (stats
    :accessor entity-stats
    :initarg :stats
    :initform nil
    :type list
    :documentation
    "Alist of this entity's stats."))
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
  (setf (entity-symbol target) #\X))

(defmethod attempt-move ((obj entity) level direction)
  "Direct an entity to attempt to move using the following logic: if the target
position can contain an entity, check if it contains another entity and attack
the entity if so, otherwise move to the target position."
  (let* ((dir (crt:get-direction direction))
         (target-y (+ (entity-y obj) (car dir)))
         (target-x (+ (entity-x obj) (cadr dir))))
    (unless (or (position-out-of-bounds-p level target-y target-x)
                (not (level-tile-can-contain-entity-p level target-y target-x)))
      (let ((target-entity (get-entity level target-y target-x)))
        (if target-entity
            (attack obj target-entity)
            (move obj direction))))))

(defclass player (entity) ()
  (:documentation
   "Player class representing the player's character in the game, player is a
child class of entity."))

(defun make-player (&key (y nil) (x nil) (pos '(0 . 0)) (symbol #\@))
  "Make a new player object."
  (flet ((make-initial-player-stats ()
           (make-stat-alist '(str 10)
                            '(dex 10)
                            '(int 10))))
    (let ((pos-arg (if (and y x)
                       (cons y x)
                       pos)))
      (make-instance 'player :pos pos-arg
                             :stats (make-initial-player-stats)
                             :symbol symbol))))

(defclass enemy (entity) ()
  (:documentation
   "Enemy class representing each of the enemies in the game, enemy is a child
class of entity."))
