;;; adinapoli-emacs --- My emacs
;;; Commentary:
;; This is where all start.

;;; Code:
(add-to-list 'load-path "~/.emacs.d/adinapoli")

(require 'adinapoli-general)
(require 'adinapoli-evil)
(require 'adinapoli-elscreen)
(require 'adinapoli-macosx)
(require 'adinapoli-gpg)
(require 'adinapoli-find-in-file)
(require 'adinapoli-find-in-project)
(require 'adinapoli-navigate-in-project)
(require 'adinapoli-syntax-checking)
(require 'adinapoli-programming-languages)
(require 'adinapoli-window-layout)
(require 'adinapoli-zen-mode)

;;;; Display time in the status bar
;;;;(defface adinapoli-display-time
;;;;   '((((type x w32 mac))
;;;;      (:foreground "#157bd4" :inherit bold))
;;;;     (((type tty))
;;;;      (:foreground "#f2777a")))
;;;;   "Face used to display the time in the mode line.")
;;;;(setq display-time-day-and-date t)
;;;;(setq display-time-24hr-format t)
;;;;(setq display-time-string-forms
;;;;       '((propertize (concat dayname " " monthname " " 12-hours ":" minutes " " am-pm mail)
;;;;  		    'face 'adinapoli-display-time)))
;;;;(display-time-mode 1)
;;
;;
;;;; SML
;;(install-and-require #'smart-mode-line)
;;(install-and-require #'smart-mode-line-powerline-theme)
;;(sml/setup)
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Dash, offline API search tool
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(install-and-require #'dash-at-point)
;;(evil-leader/set-key "d" 'dash-at-point)
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; AUTOCOMPLETE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; (install-and-require #'company)
;;;; (add-hook 'after-init-hook 'global-company-mode)
;;(install-and-require #'auto-complete)
;;(defalias 'cl-block-wrapper 'identity)
;;(eval-when-compile (require 'cl))
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;(require 'auto-complete-config)
;;(ac-config-default)
;;(global-auto-complete-mode t)
;;
;;
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(mode-line ((t (:background "black" :foreground "gray60" :inverse-video nil :box (:line-width -1 :color "Black") :height 120))))
;; '(my-long-line-face ((((class color)) (:foreground "grey10" :background "#FFCCFF"))) t)
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; SCALA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;(load-and-use #'scala-conf)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; OCAML
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(load-and-use #'ocaml-conf)
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Bash completion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(when (not (package-installed-p 'shell-command))
;;  (package-install 'shell-command))
;;(when (not (package-installed-p 'bash-completion))
;;  (package-install 'bash-completion))
;;(autoload 'bash-completion-dynamic-complete 
;;          "bash-completion"
;;          "BASH completion hook")
;;(add-hook 'shell-dynamic-complete-functions 'bash-completion-dynamic-complete)
;;(add-hook 'shell-command-complete-functions 'bash-completion-dynamic-complete)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Multiterm, "better" terminal management
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(install-and-require #'multi-term)
;;(setq multi-term-program "/bin/zsh")
;;(add-hook 'term-mode-hook (lambda ()
;;                            (global-set-key [backspace] 'delete-backward-char)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Rainbow mode, colorise color names
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(install-and-require #'rainbow-mode)
;;(add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))
;;(add-hook 'html-mode-hook (lambda () (rainbow-mode 1)))
;;(add-hook 'major-mode-hok 'rainbow-delimiters-mode)
;;
;;;; Highlights matching parenthesis
;;(install-and-require #'rainbow-delimiters)
;;(require 'paren)
;;(show-paren-mode 1)
;;
;;
;;;; Gist integration
;;(install-and-require #'gist)
;;(evil-ex-define-cmd "Gist" 'gist-buffer)
;;
;;;; Org mode
;;(load-and-use #'org-conf)
;;
;;;; Language and grammar
;;(load-and-use #'language-conf)
;;
;;;; Various modes
;;
;;;; Git integration via Magit
;;(install-and-require #'magit)
;;(evil-leader/set-key "ms" 'magit-status)
;;
;;;; Social networks
;;(load-and-use #'social-conf)
;;
;;;; Mail
;;(load-and-use #'email-conf)
;;
;;
;;(setq magit-last-seen-setup-instructions "1.4.0")
;;

(provide '.emacs)
;;; .emacs ends here
