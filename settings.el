(let ((path (shell-command-to-string ". ~/.bashrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path 
        (append
         (split-string-and-unquote path ":")
         exec-path)))


;; (use-package almost-mono-themes
;;   :ensure t
;;   :config
;;   (load-theme 'almost-mono-cream t))

(load-theme 'modus-vivendi t)

(set-face-attribute 'default nil
                    :family "JetBrains Mono"
                    :height 160
                    :weight 'normal
                    :width 'normal)

(setq mode-line-modes
      (mapcar (lambda (elem)
                (pcase elem
                  (`(:propertize (,_ minor-mode-alist . ,_) . ,_)
                   "")
                  (t elem)))
              mode-line-modes))

(setq inhibit-splash-screen t)
(transient-mark-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)


(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(display-time-mode 1)

(setq dired-listing-switches "-allht")
