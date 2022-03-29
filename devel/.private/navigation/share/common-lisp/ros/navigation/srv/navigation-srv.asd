
(cl:in-package :asdf)

(defsystem "navigation-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "move_base" :depends-on ("_package_move_base"))
    (:file "_package_move_base" :depends-on ("_package"))
  ))