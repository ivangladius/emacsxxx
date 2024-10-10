
(defun delete-region-or-char ()
  (interactive)
  (if (use-region-p)
	  (kill-region (region-beginning) (region-end))
	(delete-char 1)))
;; Region key map

(progn
  (setq region-key-map (make-sparse-keymap))
  (when (use-region-p)
    (define-key region-key-map "9" 'jump-to-char-forward)
    (define-key region-key-map "8" 'jump-to-char-backward)
    (define-key region-key-map "s" 'kill-ring-save)))

(defun scroll-down-10 ()
  (interactive)
  (scroll-down-command 10)
  (move-to-window-line nil))

(defun scroll-up-10 ()
  (interactive)
  (scroll-up-command 10)
  (move-to-window-line nil))

(defun my-page-up ()
  (interactive)
  (scroll-down)
  (move-to-window-line nil))

(defun my-page-down ()
  (interactive)
  (scroll-up)
  (move-to-window-line nil))

(global-set-key "9" 'jump-to-char-forward)
(global-set-key (kbd "C-9") '(lambda ()
			       (interactive)
			       (insert "9")))

(global-set-key "8" 'jump-to-char-backward)
(global-set-key (kbd "C-8") '(lambda ()
			       (interactive)
			       (insert "8")))

(defun jump-to-char-forward ()
  (interactive)
  (forward-char)
  (let ((key (read-key-sequence "")))
    (re-search-forward key))
  (backward-char))

(defun jump-to-char-backward ()
  (interactive)
  (let ((key (read-key-sequence "")))
    (re-search-backward key)))


(provide 'editing)
