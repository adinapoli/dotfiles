;;; ui-gimmicks.el --- Stuff
;;; Commentary: UI stuff
;;; Code:
(require 'evil-leader)
(require 'evil)

(when (file-exists-p "~/.emacs.d/util.el")
  (progn (load-file "~/.emacs.d/util.el"))
  (require 'util))

;; Slow as a dog.
(defun linum-funky-scale (line)
  (propertize
   (format (concat "  %"
                   (number-to-string
                    (length (number-to-string
                             (line-number-at-pos (point-max)))))
                   "d ")
           line)
   'face 'linum))

(if window-system
    (progn
      (set-frame-font "Envy Code R for Powerline-13")
      (setq linum-format " %4d  ")
      (set-fringe-mode 0)
    )
  (progn
    (setq linum-format "  %2d  ")
    (set-fringe-mode 0)
  )
  )

;; Hide the mode line (required by Zen Mode)
(defvar-local hidden-mode-line-mode nil)
(defvar-local hide-mode-line nil)

(define-minor-mode hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global nil
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode to make the mode-line appear."))))


(defvar zen-mode-enabled 1)

(defun enable-zen-mode ()
   (progn
     (global-linum-mode 0)
     ;;(hidden-mode-line-mode 1)
     ;;(setq elscreen-display-tab nil)
     (setq zen-mode-enabled 1)
     (if (eq nil window-system)
       (set-window-margins (selected-window) (/ (display-pixel-width) 4) 0)
       (set-window-margins (selected-window) (/ (display-pixel-width) 40) 0)
     )
     (redraw-display)
     (message "Zen Mode enabled.")))

(defun disable-zen-mode ()
   (progn
     (global-linum-mode 1)
     (hidden-mode-line-mode 0)
     ;;(elscreen-toggle-display-tab)
     (setq zen-mode-enabled nil)
     (redraw-display)
     (message "Zen Mode disabled.")))


(defun zen-mode-core ()
  (if zen-mode-enabled
   (disable-zen-mode)
   (enable-zen-mode)))

;; Tentative Zen Mode
;; Hides everything if I want
(defun zen-mode ()
 (interactive)
 (zen-mode-core))

(provide 'ui-gimmicks)
;;; ui-gimmicks.el ends here
