(require 'util)

(install-and-require #'notmuch)
(install-and-require #'notmuch-labeler)
(install-and-require #'offlineimap)
(require 'evil)

(evil-define-key 'normal 'notmuch-search-mode-map
  "q"  'notmuch-kill-this-buffer
  "\r" 'notmuch-search-show-thread)

(evil-define-key 'normal 'notmuch-show-mode-map
  "q" 'notmuch-kill-this-buffer)

;; Get the email pwd from an encrypted gpg file.
(defun offlineimap-get-password (host port)
      (let* ((netrc (netrc-parse (expand-file-name "~/.netrc.gpg")))
             (hostentry (netrc-machine netrc host port port)))
        (when hostentry (netrc-get hostentry "password"))))


;; Notmuch specific settings
(defvar notmuch-hello-refresh-count 0)

(defun notmuch-hello-refresh-status-message ()
  (unless no-display
    (let* ((new-count
             (string-to-number
               (car (process-lines notmuch-command "count"))))
           (diff-count (- new-count notmuch-hello-refresh-count)))
      (cond
        ((= notmuch-hello-refresh-count 0)
         (message "You have %s messages."
                  (notmuch-hello-nice-number new-count)))
        ((> diff-count 0)
         (message "You have %s more messages since last refresh."
                  (notmuch-hello-nice-number diff-count)))
        ((< diff-count 0)
         (message "You have %s fewer messages since last refresh."
                  (notmuch-hello-nice-number (- diff-count)))))
      (setq notmuch-hello-refresh-count new-count))))

(add-hook 'notmuch-hello-refresh-hook 'notmuch-hello-refresh-status-message)

(provide 'notmuch-conf)
;;; notmuch-conf.el ends here
