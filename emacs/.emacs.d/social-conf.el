
(when (file-exists-p "~/.emacs.d/util.el")
  (progn (load-file "~/.emacs.d/util.el"))
  (require 'util))

(install-and-require #'twittering-mode)
(setq twittering-use-master-password t)

;;; ERC
(load-and-use #'erc-conf)

;;; Spotify! (OS X Only)
(when-darwin (install-and-require #'helm-spotify))

;;; Jabber
(install-and-require #'jabber)
(setq jabber-account-list
      '(("alfredo.dinapoli@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl))
       )
)


(provide 'social-conf)
;; social-conf.el ends here
