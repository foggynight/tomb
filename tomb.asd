(asdf:defsystem :tomb
    :author "Robert Coffey"
    :license "GPLv2"
    :version "0.1.0"
    :depends-on (:croatoan)
    :pathname "src/"
    :components
    ((:file "package")

     (:file "main")))
