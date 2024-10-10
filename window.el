


(defun split-right ()
  (interactive)
  (split-window-right)
  (other-window 1))

(defun split-below ()
  (interactive)
  (split-window-below)
  (other-window 1))

(defun last-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))




(provide 'window)



