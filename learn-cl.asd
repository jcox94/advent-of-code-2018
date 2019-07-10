;;;; learn-cl.asd

(asdf:defsystem #:learn-cl
  :description "Describe learn-cl here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "./src/day1")
	       (:file "./src/day2")))

