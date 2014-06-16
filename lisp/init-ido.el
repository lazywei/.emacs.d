;;; init-ido.el --- The configuration for IDO

(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
;;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-max-directory-size 100000)

(provide 'init-ido)
;;; init-ido.el ends here
