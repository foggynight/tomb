(in-package :tomb)

(defun make-stat (name base &optional (current base))
  "Make a new stat object.
- `name': Name of the stat
- `base': Actual level of the stat
- `current': Level to be used in calculations involving the stat"
  (list name base current))

(defmacro stat-name (stat)
  "Access the name of a stat."
  `(car ,stat))

(defmacro stat-base (stat)
  "Access the base level of a stat."
  `(cadr ,stat))

(defmacro stat-current (stat)
  "Access the current level of a stat."
  `(caddr ,stat))

(defun make-stat-alist (&rest rest)
  "Make an alist of stats where the keys are the stat names and the datums are
lists containing the base and current levels of the stat."
  (map 'list (lambda (e)
               (apply #'make-stat e))
       rest))
