(in-package #:day2)

(defun read-input (path)
  (with-open-file (s path)
    (loop for line = (read-line s nil)
       while line collect line)))

(defun letter-count (line)
  (let ((table (make-hash-table)))
    (loop for i across line do
	 (if (eql (gethash i table) nil)
	     (setf (gethash i table) 1)
	     (incf (gethash i table))))
    table))

(defun find-match (table num)
  (loop for v being the hash-values in table using (hash-key k) do
       (if (eql v num)
	   (return-from find-match t)))
  nil)

(defun checksum (lines)
  (let ((two 0) (three 0))
    (loop for line in lines do
	 (let ((table (letter-count line)))
	   (if (find-match table 2)
	       (incf two))
	   (if (find-match table 3)
	       (incf three))))
    (* two three)))

(defun part-one ()
  (checksum (read-input "../input/day2.txt")))

(defun add-to-table (char)
  ())
