;;;; Stat Data Structure
;;
;; Stats are represented using lists containing the following members:
;; - NAME: Atomic symbol - Name of the stat
;; - BASE: Integer - Base level of the stat
;; - CURRENT: Integer - Level to be used in calculations involving the stat
;;
;; Lists are used instead of objects to allow stats to be stored in an alist,
;; with their names as the keys and a list containing their base and current
;; levels as the datums, by simply filling a list with stats.

(in-package :tomb)

(defun make-stat (name base &optional (current base))
  "Make a new stat with the name NAME, base level BASE, and optionally, current
level CURRENT, with CURRENT defaulting to the value of BASE."
  (list name base current))

(defmacro stat-name (stat)
  "Access the NAME member of a stat."
  `(car ,stat))

(defmacro stat-base (stat)
  "Access the BASE member of a stat."
  `(cadr ,stat))

(defmacro stat-current (stat)
  "Access the CURRENT member of a stat."
  `(caddr ,stat))

(defun make-stat-alist (&rest rest)
  "Make an alist of stats.

This function takes any number of lists as arguments, each representing a stat
to make and containing the arguments to be passed to the MAKE-STAT function.

e.g.
 (MAKE-STAT-ALIST '(STR 10)
                  '(DEX 10)
                  '(INT 10))
 => ((STR 10 10)
     (DEX 10 10)
     (INT 10 10))"
  (mapcar (lambda (e) (apply #'make-stat e))
          rest))
