;;; init-misc.el --- The configuration for misc settings

;;; Color Theme
(color-theme-solarized-dark)
(powerline-default-theme)

;;; Backup Setting
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying-when-linked t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(provide 'init-misc)
;;; init-misc.el ends here
