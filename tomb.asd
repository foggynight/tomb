(asdf:defsystem :tomb
  :author "Robert Coffey"
  :license "GPLv2"
  :version "0.1.0"
  :depends-on (:croatoan)
  :pathname "src/"
  :serial t
  :components ((:file "package")

               (:file "tile")
               (:file "level")
               (:file "world")

               (:file "screen")

               (:file "main")))
