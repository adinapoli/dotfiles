(require 'util)
(when (file-exists-p "~/.emacs.d/sr-speedbar.el")
  (progn (load-file "~/.emacs.d/sr-speedbar.el"))
  (require 'sr-speedbar))

(provide 'ide-conf)
;;; ide-conf.el ends here
