
(require 'scripts)
(require 'window)
(require 'editing)

(global-set-key (kbd "M-c") #'kill-ring-save)

(defhydra global-window-keys ()
  ("o" delete-other-windows "delete other windows" :exit t)
  ("p" delete-window "delete current window" :exit t)
  ("[" split-below "split below" :exit t)
  ("]" split-right "split right" :exit t)
  ("'" winner-undo "winner undo" :exit t)
  ("\\" winner-undo "winner undo" :exit t)
  ("b" last-buffer "last buffer" :exit t)
  ("k" #'(lambda ()
	   (interactive)
	   (kill-buffer (current-buffer)))
   :exit t)
  )

(windmove-default-keybindings)
(global-set-key (kbd "M-h") #'windmove-left)
(global-set-key (kbd "M-l") #'windmove-right)
(global-set-key (kbd "M-k") #'windmove-up)
(global-set-key (kbd "M-j") #'windmove-down)
(global-set-key (kbd "C-w") #'(lambda ()
				(interactive)
				(call-interactively 'kill-ring-save)))

(global-set-key (kbd "C-M-n") #'previous-buffer)
(global-set-key (kbd "C-M-p") #'next-buffer)

(global-set-key (kbd "C-d") #'delete-region-or-char)

(global-set-key (kbd "M-w") #'global-window-keys/body)

(global-set-key (kbd "M-0") #'scroll-up-10)
(global-set-key (kbd "M-9") #'scroll-down-10)



;;(global-set-key (kbd "M-") 'last-buffer)

(global-set-key (kbd "C-M-k") #'(lambda ()
			       (interactive)
			       (kill-buffer (current-buffer))
			       (call-interactively 'delete-window)))
(use-package bind-key
  :ensure t)

  

