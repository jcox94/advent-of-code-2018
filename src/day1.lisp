;;;; learn-cl.lisp

(in-package #:day1)

(defvar *table* (make-hash-table))

(defun reset-table ()
  (setf *table* (make-hash-table)))

(defun run-find ()
  (let ((freqs (read-input "../input/day1.txt")))
     (sethash 0 *table* 0)
     (find-dup-freq freqs 0)))

(defun find-dup-freq (freqs sum)
  (dolist (x freqs)
    (setf sum (+ sum x))
    (let ((elem (gethash sum *table*)))
      (if (eql elem nil)
	   (sethash sum *table* sum)
	   (return-from find-dup-freq sum))))
  (find-dup-freq freqs sum))

(defmacro sethash (key hash val)
  `(setf (gethash ,key ,hash) ,val))

(defun read-input (path)
  (with-open-file (s path)
    (loop for line = (read-line s nil)
       while line collect (parse-integer line))))

(defun main ()
  (time (run-find)))
