(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; set local recipes, el-get-sources should only accept PLIST element
(setq
 el-get-sources
 '((:name buffer-move; have to add your own keys
	  :after (progn
		   (global-set-key (kbd "<C-S-up>")     'buf-move-up)
		   (global-set-key (kbd "<C-S-down>")   'buf-move-down)
		   (global-set-key (kbd "<C-S-left>")   'buf-move-left)
		   (global-set-key (kbd "<C-S-right>")  'buf-move-right)))

   (:name smex; a better (ido like) M-x
	  :after (progn
		   (setq smex-save-file "~/.emacs.d/.smex-items")
		   (global-set-key (kbd "M-x") 'smex)
		   (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

   (:name magit; git meet emacs, and a binding
	  :after (progn
		   (global-set-key (kbd "C-x C-z") 'magit-status)))

   (:name goto-last-change; move pointer back to last change
	  :after (progn
		   ;; when using AZERTY keyboard, consider C-x C-_
		   (global-set-key (kbd "C-x C-/") 'goto-last-change)))

   (:name flx; fuzzy matching
   	  :after (progn
   		   (require 'flx-ido)))

   (:name projectile; project interaction
	  :after (progn
		   (require 'projectile)
		   (projectile-global-mode)))

   (:name smartparens
	  :after (progn
		   (require 'smartparens-config)
		   (smartparens-global-mode)
		   (show-smartparens-global-mode)
		   (setq sp-show-pair-delay 0)))
))

(setq packages-evil
      '(
	evil
	evil-leader
	evil-surround
	))

(setq packages-auto-complete
      '(
	auto-complete
	))

(setq packages-utilities
      '(
	full-ack
	key-chord
	flymake
	flymake-ruby
        ))

(setq packages-theme
      '(
        color-theme
        color-theme-solarized
	powerline
        ))

(setq packages-other
      '(
	dired+
	ido-vertical-mode
	))

;; install new packages and init already installed packages
(el-get 'sync
        packages-evil
        packages-auto-complete
        packages-utilities
        packages-theme
	packages-other
         (loop for src in el-get-sources collect (el-get-source-name src)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-key-chord)
(require 'init-ido)
(require 'init-dired)
(require 'init-evil)
(require 'init-misc)
