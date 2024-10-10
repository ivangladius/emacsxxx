
(require 'hydra)

(use-package counsel
  :ensure t)


(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t
	ivy-dynamic-exhibit-delay-ms 150
	enable-recursive-minibuffers t
	counsel-find-file-asynchronous t
	ivy-height 15)
  (defhydra ivy-keys ()
;;    ("o" counsel-file-jump "find file" :exit t)
    ("o" #'(lambda ()
	     (interactive)
	     (let ((counsel-find-file-ignore-regexp "^\\."))
	       (counsel-file-jump nil nil))))
    ("M-o" (lambda ()
	     (interactive)
	     (let ((default-directory "~/"))
	       (counsel-file-jump nil default-directory)))
     "find file from home" :exit t)
    ("l" counsel-find-file "find file (normal)" :exit t)
    ("M-l" (lambda ()
	     (interactive)
	     (let ((default-directory "~/"))
	       (counsel-find-file nil default-directory)))
     "find file from home (normal)" :exit t)
    
    ("i" counsel-dired-jump "find directory" :exit t)
    ("M-i" (lambda () (interactive)
	     (let ((default-directory "~/"))
	       (counsel-dired-jump)))
     "find directory from home" :exit t)
    ("k" counsel-dired "find directory (normal)" :exit t)
    ("M-k" (lambda () (interactive)
	     (let ((default-directory "~/"))
	       (counsel-dired)))
     "find directory from home (normal)" :exit t)

    ("j" counsel-switch-buffer "switch buffer" :exit t)
    ("r" counsel-recentf "recent files" :exit t)
    ("g" counsel-git-grep "git grep" :exit t)
    ("m" counsel-imenu "imenu" :exit t)
    )
  
  (global-set-key (kbd "M-q") #'ivy-keys/body)

  (global-set-key (kbd "M-x") #'counsel-M-x)
  (global-set-key (kbd "M-]") #'swiper)
  (global-set-key (kbd "C-M-]") #'counsel-ag)
  (ivy-mode)
  )
