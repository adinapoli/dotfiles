
(setq gofmt-command "goimports")
(defun adinapoli-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(add-hook 'go-mode-hook 'adinapoli-go-mode-hook)

(provide 'go-conf)
;;; go-conf.el ends here
