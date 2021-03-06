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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(kaolin-hl-line-colored t)
 '(package-selected-packages
   (quote
    (doom-themes nord-theme kaolin-themes fill-column-indicator cyberpunk-theme json-mode fzf ## yaml-mode shackle rust-mode purescript-mode neotree markdown-mode jedi intero hindent helm-themes helm-projectile go-mode flycheck-rust flycheck-elm emmet-mode elscreen elm-mode ag)))
 '(safe-local-variable-values
   (quote
    ((haskell-indent-offset . 4)
     (haskell-indentation-where-pre-offset . 2)
     (haskell-indentation-where-post-offset . 2)
     (haskell-tags-on-save)
     (haskell-tags-on-save . f)
     (haskell-stylish-on-save . t)
     (haskell-indent-spaces . 4)
     (haskell-indentation-layout-offset . 4)
     (haskell-indentation-left-offset . 4)
     (haskell-indentation-starter-offset . 4))))
 '(tramp-verbose 6 nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
