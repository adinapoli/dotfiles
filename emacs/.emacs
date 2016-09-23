;;; adinapoli-emacs --- My emacs
;;; Commentary:
;; This is where all start.

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

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

(provide '.emacs)
;;; .emacs ends here
