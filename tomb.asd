(asdf:defsystem :tomb
  :author "Robert Coffey"
  :license "GPLv2"
  :version "0.1.0"

  :build-operation "asdf:program-op"
  :build-pathname "../tomb"
  :depends-on (:croatoan)
  :entry-point "tomb:main"
  :pathname "src/"

  :serial t
  :components ((:file "package")

               (:file "entity")

               (:file "tile")
               (:file "level")
               (:file "world")

               (:file "screen")

               (:file "main")))
