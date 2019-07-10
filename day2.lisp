(defvar *2-digit* 0)
(defvar *3-digit* 0)

(defvar *list* (read-input "input/day2.txt"))

(defun read-input (path)
  (with-open-file (s path)
    (loop for line = (read-line s nil)
       while line collect line)))


