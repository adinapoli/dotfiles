(require 'tls)
(require 'erc)

;;; Code:
(defvar well-typed-identities '("alfredo"))
(defvar erc-current-nick-highlight-type 'nick)
(defvar erc-keywords '("alfredo"))
(defvar erc-track-use-faces t)
(defvar erc-track-faces-priority-list
      '(erc-current-nick-face erc-keyword-face))
(defvar erc-track-priority-faces-only 'all)

(defun well-typed-pop-mention (&rest ignore)
  (let ((buffer (erc-track-get-active-buffer 1))
        (active-minibuffer (active-minibuffer-window)))
    (when buffer
      (when active-minibuffer
        (next-in-frame-window))
      (if (>= 10 (window-height))
          (window-resize (get-buffer-window) 10))
      (split-window-below -10)
      (other-window 1)
      (erc-track-switch-buffer 1)
      (if active-minibuffer
          (switch-to-buffer active-minibuffer)
        (other-window -1)))))
(add-hook 'erc-track-list-changed-hook 'well-typed-pop-mention)

(defun well-typed-identify ()
  (interactive)
  (let* ((identity
          (completing-read
           "identity: " well-typed-identities nil nil nil nil
           (first well-typed-identities)))
         (password (read-passwd "password: "))
         (command (format "/msg NickServ identify %s %s" identity password)))
    (erc-load-irc-script-lines (list command))
    (let ((inhibit-read-only t))
      (buffer-disable-undo)
      (erase-buffer)
      (buffer-enable-undo))))

(defun well-typed ()
  (interactive)
  (erc-tls :server "irc.well-typed.com" :port 6697))

(provide 'erc-conf)
;;; erc-conf.el ends here
