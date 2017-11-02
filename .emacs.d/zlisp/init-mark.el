(require 'f)

(if (boundp 'mark-learning-dir)
    (unless (file-directory-p mark-learning-dir)
      (make-directory mark-learning-dir))
  (progn
    (setq mark-note-dir (expand-file-name "Notes" mark-learning-dir))
    (unless (file-directory-p mark-note-dir)
      (make-directory mark-note-dir)))
  (user-error "No learning dir"))

(defun mark-note-python ()
  "OPEN python note index, dir if not exist, otherwise mkdir and open."
  (interactive
   (if (boundp 'mark-note-dir)
       (let* ((mark/python-init-file (expand-file-name "index.org"
						      (f-short (f-join mark-note-dir
								       "Python")))))
	 (if (file-exists-p mark/python-init-file)
	     (find-file mark/python-init-file)
	     (user-error "No python note index exist")))
     (user-error "No note dir exist!"))))

(defun mark-note-fosv5 ()
  "OPEN fosv5 index, dir if not exist, otherwise mkdir and open."
  (interactive
   (if (boundp 'mark-note-dir)
       (let* ((mark/python-init-file (expand-file-name "index.org"
						      (f-short (f-join mark-note-dir
								       "FOSv5")))))
	 (if (file-exists-p mark/python-init-file)
	     (find-file mark/python-init-file)
	     (user-error "No python note index exist")))
     (user-error "No note dir exist!"))))

(provide 'init-mark)
