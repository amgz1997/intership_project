;; Auto-generated. Do not edit!


(when (boundp 'navigation::move_base)
  (if (not (find-package "NAVIGATION"))
    (make-package "NAVIGATION"))
  (shadow 'move_base (find-package "NAVIGATION")))
(unless (find-package "NAVIGATION::MOVE_BASE")
  (make-package "NAVIGATION::MOVE_BASE"))
(unless (find-package "NAVIGATION::MOVE_BASEREQUEST")
  (make-package "NAVIGATION::MOVE_BASEREQUEST"))
(unless (find-package "NAVIGATION::MOVE_BASERESPONSE")
  (make-package "NAVIGATION::MOVE_BASERESPONSE"))

(in-package "ROS")





(defclass navigation::move_baseRequest
  :super ros::object
  :slots (_x _y _theta ))

(defmethod navigation::move_baseRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _theta
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta
     (setq _theta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass navigation::move_baseResponse
  :super ros::object
  :slots (_A ))

(defmethod navigation::move_baseResponse
  (:init
   (&key
    ((:A __A) 0)
    )
   (send-super :init)
   (setq _A (round __A))
   self)
  (:A
   (&optional __A)
   (if __A (setq _A __A)) _A)
  (:serialization-length
   ()
   (+
    ;; uint64 _A
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint64 _A
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _A (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _A) (= (length (_A . bv)) 2)) ;; bignum
              (write-long (ash (elt (_A . bv) 0) 0) s)
              (write-long (ash (elt (_A . bv) 1) -1) s))
             ((and (class _A) (= (length (_A . bv)) 1)) ;; big1
              (write-long (elt (_A . bv) 0) s)
              (write-long (if (>= _A 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _A s)(write-long (if (>= _A 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint64 _A
     
#+(or :alpha :irix6 :x86_64)
      (setf _A (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _A (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass navigation::move_base
  :super ros::object
  :slots ())

(setf (get navigation::move_base :md5sum-) "f4bf476788e86695cf4dce503ea03010")
(setf (get navigation::move_base :datatype-) "navigation/move_base")
(setf (get navigation::move_base :request) navigation::move_baseRequest)
(setf (get navigation::move_base :response) navigation::move_baseResponse)

(defmethod navigation::move_baseRequest
  (:response () (instance navigation::move_baseResponse :init)))

(setf (get navigation::move_baseRequest :md5sum-) "f4bf476788e86695cf4dce503ea03010")
(setf (get navigation::move_baseRequest :datatype-) "navigation/move_baseRequest")
(setf (get navigation::move_baseRequest :definition-)
      "float64 x
float64 y
float64 theta
---
uint64 A
")

(setf (get navigation::move_baseResponse :md5sum-) "f4bf476788e86695cf4dce503ea03010")
(setf (get navigation::move_baseResponse :datatype-) "navigation/move_baseResponse")
(setf (get navigation::move_baseResponse :definition-)
      "float64 x
float64 y
float64 theta
---
uint64 A
")



(provide :navigation/move_base "f4bf476788e86695cf4dce503ea03010")


