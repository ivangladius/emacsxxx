
(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "M-]") #'avy-goto-char-2)
  (global-set-key (kbd "C-M-]") #'avy-goto-char))
