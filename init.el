(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq essential-packages '(use-package))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package essential-packages)
  (unless (package-installed-p package)
    (package-install package)))

(setq native-comp-async-report-warnings-errors nil)

(load "~/.emacs.d/settings.el")
(load "~/.emacs.d/hydra.el")
(load "~/.emacs.d/editing.el")
(load "~/.emacs.d/scripts.el")
(load "~/.emacs.d/window.el")
(load "~/.emacs.d/global-keybinds.el")
;;(load "~/.emacs.d/ivy.el")
(load "~/.emacs.d/vertico.el")
(load "~/.emacs.d/company.el")
(load "~/.emacs.d/consult.el")
(load "~/.emacs.d/winner.el")
(load "~/.emacs.d/winner.el")
(load "~/.emacs.d/treemacs.el")
(load "~/.emacs.d/sly.el")
(load "~/.emacs.d/avy.el")







(shell-command "setxkbmap -option ctrl:nocaps")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ffba0482d3548c9494e84c1324d527f73ea4e43fff8dfd0e48faa8fc6d5c2bc7" "d0fd069415ef23ccc21ccb0e54d93bdbb996a6cce48ffce7f810826bb243502c" default))
 '(package-selected-packages
   '(modus-vivendi almost-mono-themes sly all-the-icons consult vertico-buffer vertico hydra counsel company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
