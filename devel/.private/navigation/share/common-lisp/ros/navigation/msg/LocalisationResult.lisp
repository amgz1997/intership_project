; Auto-generated. Do not edit!


(cl:in-package navigation-msg)


;//! \htmlinclude LocalisationResult.msg.html

(cl:defclass <LocalisationResult> (roslisp-msg-protocol:ros-message)
  ((result_code
    :reader result_code
    :initarg :result_code
    :type cl:integer
    :initform 0))
)

(cl:defclass LocalisationResult (<LocalisationResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LocalisationResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LocalisationResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name navigation-msg:<LocalisationResult> is deprecated: use navigation-msg:LocalisationResult instead.")))

(cl:ensure-generic-function 'result_code-val :lambda-list '(m))
(cl:defmethod result_code-val ((m <LocalisationResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader navigation-msg:result_code-val is deprecated.  Use navigation-msg:result_code instead.")
  (result_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LocalisationResult>) ostream)
  "Serializes a message object of type '<LocalisationResult>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result_code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'result_code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'result_code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'result_code)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LocalisationResult>) istream)
  "Deserializes a message object of type '<LocalisationResult>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result_code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'result_code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'result_code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'result_code)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LocalisationResult>)))
  "Returns string type for a message object of type '<LocalisationResult>"
  "navigation/LocalisationResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LocalisationResult)))
  "Returns string type for a message object of type 'LocalisationResult"
  "navigation/LocalisationResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LocalisationResult>)))
  "Returns md5sum for a message object of type '<LocalisationResult>"
  "6ef5c02243cd2c6c3b25e8d094bd9470")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LocalisationResult)))
  "Returns md5sum for a message object of type 'LocalisationResult"
  "6ef5c02243cd2c6c3b25e8d094bd9470")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LocalisationResult>)))
  "Returns full string definition for message of type '<LocalisationResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the result~%uint32 result_code #un numero pour d??fenir le resultat de la navigation~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LocalisationResult)))
  "Returns full string definition for message of type 'LocalisationResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the result~%uint32 result_code #un numero pour d??fenir le resultat de la navigation~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LocalisationResult>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LocalisationResult>))
  "Converts a ROS message object to a list"
  (cl:list 'LocalisationResult
    (cl:cons ':result_code (result_code msg))
))
