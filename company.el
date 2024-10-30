

(use-package company
  :ensure t
  :demand t
  :config
  (setq company-dabbrev-downcase 3)
  (setq company-idle-delay 0.5)
  (setq company-minimum-prefix-length 3)
  (define-key company-active-map (kbd "<tab>") #'company-complete-selection)
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd "RET") nil)
  (global-company-mode))







