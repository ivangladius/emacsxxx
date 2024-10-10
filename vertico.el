;; Enable vertico

(require 'consult)
(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  :config
  (defhydra vertico-keys ()
    ("o" #'find-file :exit t)
    ("M-o" (lambda ()
	     (interactive)
	     (let ((default-directory "~/"))
	       (call-interactively 'find-file)))
     "find file from home" :exit t)
    ("l" find-file "find file (normal)" :exit t)
    ("M-l" (lambda ()
	     (interactive)
	     (let ((default-directory "~/"))
	       (call-interactively 'find-file)))
     "find file from home (normal)" :exit t)
    
    ("i" dired-jump "find directory" :exit t)
    ("M-i" (lambda () (interactive)
	     (let ((default-directory "~/"))
	       (dired-jump)))
     "find directory from home" :exit t)
    ("k" dired "find directory (normal)" :exit t)
    ("M-k" (lambda () (interactive)
	     (let ((default-directory "~/"))
	       (dired)))
     "find directory from home (normal)" :exit t)

    ("j" consult-buffer "switch buffer" :exit t)
    ("r" consult-recent-file "recent files" :exit t)
    ("g" consult-git-grep "git grep" :exit t)
    ("m" consult-imenu "imenu" :exit t)
    ("M-b" bookmark-set "bookmark set" :exit t)
    ("b" counsel-bookmark "bookmark set" :exit t)
    ("/" counsel-ag "ag" :exit t)
    )
  (global-set-key (kbd "M-q") #'vertico-keys/body)
  )
						    
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :custom
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode))

;; Configure directory extension.
(use-package vertico-directory
  :after vertico
  :ensure nil
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file name
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

