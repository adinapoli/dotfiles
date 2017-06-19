
;; Map some evil keybindinds just in scala mode
(require 'evil-leader)
(require 'evil)
(require 'util)

(install-and-require #'scala-mode2)
(add-to-list 'load-path "~/bin/ensime/elisp/")
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(require 'ensime)

(evil-leader/set-key-for-mode 'scala-mode
  "t" 'ensime-inspect-type-at-point
  "c" 'ensime-sbt-do-compile
  "j" 'ensime-go-to-definition
  "e" 'ensime-show-all-errors-and-warnings
  "i" 'ensime-import-type-at-point)

(defun ensime-go-to-definition ()
  (interactive)
  (evil-set-marker 65) ;;mA
  (funcall #'ensime-edit-definition))


(defvar ec/timer-seconds-delay 1.0
  "The delay before a message is shown in minibuffer, prevents
  minibuffer flickering")

(defvar ec/message-at-point nil
  "Message at point, after last command")

(defvar ec/display-timer nil
  "A timer; when it fires, it displays the stored message.")


(defun ec/message-at-point ()
  (when (ensime-connected-p)
    (let* ((point (point))
           (ident (tooltip-identifier-from-point point)))
      (cond
       ;; compiler warning
       ((ensime-overlays-at point)
        (format "error: \"%s\""
                (overlay-get (car (ensime-overlays-at point)) 'help-echo)))
       ;; type info
       (ident
        (let ((type (ensime-eval
                     `(swank:type-at-point ,buffer-file-name ,point))))
          (when type
            (format "type: %s" (ensime-type-full-name-with-args type)))))))))


(defun ec/show-message-at-point-pretty-soon ()
  (when evil-normal-state-p
    (progn
      (when ec/display-timer
        (cancel-timer ec/display-timer))
      (let ((message-at-point (ec/message-at-point)))
        (if message-at-point
          (setq ec/message-at-point message-at-point
                ec/display-timer (run-at-time (format "%f sec" ec/timer-seconds-delay) nil 'ec/show-stored-message-now))
          (setq ec/message-at-point nil
                ec/display-timer nil))))))


(defun ec/show-stored-message-now ()
  (interactive)
  (let ((editing-p (= (minibuffer-depth) 0)))
    (when (and ec/message-at-point editing-p)
      (message "%s" ec/message-at-point)
      (setq ec/display-timer nil))))


(eval-after-load "ensime"
  '(progn
     (defadvice ensime-mode (before ec/post-command-fn activate compile)
       "Add functionality to the post command hook so that if the
        cursor is sitting on an error the error information is displayed
        in the minibuffer (rather than having to mouse over it)"
       (set (make-local-variable 'post-command-hook)
            (cons 'ec/show-message-at-point-pretty-soon post-command-hook)))))


(provide 'scala-conf)
;;; scala-conf.el ends here
