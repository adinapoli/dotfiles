(require 'util)
(require 'evil-leader)
(require 'evil)

(load-if-exist "~/bin/mu/share/emacs/site-lisp/mu4e/" #'mu4e)

;; default
(setq mu4e-maildir (expand-file-name "~/mail"))

(setq mu4e-drafts-folder "/personal/[Gmail].Drafts")
(setq mu4e-sent-folder   "/personal/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/personal/[Gmail].Trash")

;; don't save message to Sent Messages, GMail/IMAP will take care of this
(setq mu4e-sent-messages-behavior 'delete)


(evil-define-key 'normal mu4e-headers-mode-map
  (kbd "RET") 'mu4e-headers-view-message)

(evil-leader/set-key-for-mode 'mu4e-main-mode
  "n" 'mu4e-headers-search-bookmark
  )

;; setup some handy shortcuts
(setq mu4e-maildir-shortcuts
      '(("/personal/INBOX"             . ?i)
        ("/personal/[Gmail].Sent Mail" . ?s)
        ("/personal/[Gmail].Trash"     . ?t)))

;; something about ourselves
(setq
 user-mail-address "alfredo.dinapoli@gmail.com"
 user-full-name  "Alfredo Di Napoli"
 ;; message-signature
 ;;  (concat
 ;;    "Foo X. Bar\n"
 ;;    "http://www.example.com\n")
)

 
;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu
(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)
 
;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; show images
(setq mu4e-show-images t)

;; convert org mode to HTML automatically
(setq org-mu4e-convert-to-html t)

(provide 'email-conf)
