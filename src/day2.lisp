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

(defun comp-lines (line1 line2)
  (let ((mismatch nil))
    (loop for c1 across line1
       for c2 across line2 do
	 (if (not (eql c1 c2))
	     (if mismatch
		 (return-from comp-lines nil)
		 (setf mismatch t))))
    t))

(defun find-match (list)
  (let ((first-elem (first list))
	(IDs (rest list)))
    (loop for elem in IDs do
	 (if (comp-lines first-elem elem)
	     (return-from find-match (list first-elem elem))
	     )))
  (find-match (rest list)))

(defun construct-string (s1 s2)
  (let ((result ""))
    (loop for i across s1
       for j across s2 do
	 (if (eql i j)
	     (setf result (concatenate 'string result (string i)))))
    result))

(defun get-answer (file-path)
  (let ((result (find-match (read-input file-path))))
    (destructuring-bind (s1 s2) result
      (construct-string s1 s2))))

(defun part-two ()
  (get-answer "../input/day2.txt"))

(defun add-to-table (char)
  ())
