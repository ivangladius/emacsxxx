

(use-package sly
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl")
  (defhydra lisp-keys ()
    ("o" #'sly-compile-defun :exit t)
    ("i" #'sly-eval-last-expression :exit t)
    ("j" #'slime-fast-repl :exit t)
    ("f" #'sly-compile-file :exit t)
    ("m" #'sly-macroexpand-1-inplace))
  (global-set-key (kbd "M-e") #'lisp-keys/body)
  )


(defun open-windows ()
  (mapcar #'buffer-name (mapcar #'window-buffer (window-list))))


(defun jump-to-repl ()
  (let ((windows (open-windows)))
    (dolist (win windows)
      (when (string-match-p (regexp-quote "repl") win)
        (select-window (get-buffer-window win))))))

(defun slime-fast-repl ()
  (interactive)
  (sly-compile-defun)
  (re-search-backward "(defun" nil t nil)
  (forward-word)
  (forward-word)
  (let ((cur-word (thing-at-point 'symbol 'no-properties)))
    (jump-to-repl)
    (insert "(")
    (insert cur-word)
    (insert " )")
    (backward-char)))



  
