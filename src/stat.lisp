(in-package :tomb)

(defclass stat ()
  ((name
    :accessor stat-name
    :initarg :name
    :type string
    :documentation
    "The name of this stat.")
   (base
    :accessor stat-base
    :initarg :base
    :type integer
    :documentation
    "The actual level which an entity has in this stat. This level will only
change when an entity levels this stat up.")
   (current
    :accessor stat-current
    :initarg :current
    :type integer
    :documentation
    "The level to be used in an entity's calculations involving this stat. This
level will change depending on the state of the game, but is initially equal to
the stat's base level."))
  (:documentation
   "Stat class representing a single stat of an entity."))

(defun make-stat (name base &optional (current base))
  "Make a new stat object."
  (make-instance 'stat :name name
                       :base base
                       :current current))
