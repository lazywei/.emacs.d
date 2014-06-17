;;; init-evil.el --- The configuration for Evil mode

(global-evil-leader-mode)
(evil-mode 1)

;;; Make sure we enable key chord
(require 'init-key-chord)

(evil-leader/set-leader ",")
(evil-leader/set-key
  "." 'evil-normal-state
  "k" 'kill-this-buffer
  "w" 'save-buffer
  "b" 'switch-to-buffer
  "x" 'smex
  
  ;;; Projectile related
  "f" 'projectile-find-file
  "d" 'projectile-find-dir
  
  ;;; Magit related
  "mg" 'magit-status
)

(key-chord-define evil-normal-state-map ",." 'evil-force-normal-state)
(key-chord-define evil-visual-state-map ",." 'evil-change-to-previous-state)
(key-chord-define evil-insert-state-map ",." 'evil-normal-state)
(key-chord-define evil-replace-state-map ",." 'evil-normal-state)

(provide 'init-evil)
;;; init-evil.el ends here
