(require 'util)
(require 'flycheck)
(require 'evil-leader)
(require 'evil)
;;; Code:

(unless (string= "1" (getenv "NIX_ENV"))
  (progn
    (add-to-list 'exec-path "~/.cabal/bin")
    (add-to-list 'exec-path "/usr/hs/bin/")
  ))

(defcustom hoogle-binary-path (expand-file-name "~/.cabal/bin/hoogle")
  "Path to the local 'hoogle' binary."
  :type 'file
  :group 'haskell)

(install-and-require #'haskell-mode)
;(install-and-require #'ghc)
(load-and-use #'hsenv)
(load-and-use #'web-mode)
(load-and-use #'helm-hoogle)
(install-and-require #'hindent)
;; (install-and-require #'company-ghc)

(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook #'hindent-mode)

(setq haskell-program-name "ghci")

;; ghc-mod does not support cabal-1.22 and ghc-7.8.4
;;(autoload 'ghc-init "ghc" nil t)
;;(autoload 'ghc-debug "ghc" nil t)
;;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
;; (add-to-list 'company-backends 'company-ghc)
;; (custom-set-variables '(company-ghc-show-info t))

(defun complete-or-indent ()
  (interactive)
  (if (company-manual-begin)
    (company-complete-common)
    (indent-according-to-mode)))

(defconst hidden-packages '("monads-tf" "MonadCatchIO-mtl"))

(flycheck-define-checker haskell-stack
  "A Haskell syntax and type checker using ghc.
  See URL `http://www.haskell.org/ghc/'."
  :command ("stack" "ghc" "--" "-Wall" "-fno-code"
            (option-flag "-no-user-package-db"
                         flycheck-ghc-no-user-package-database)
            (option-list "-package-db" flycheck-ghc-package-databases)
            (option-list "-i" flycheck-ghc-search-path concat)
            ;; Include the parent directory of the current module tree, to
            ;; properly resolve local imports
            (eval (concat
                   "-i"
                   (flycheck-module-root-directory
                    (flycheck-find-in-buffer flycheck-haskell-module-re))))
            (option-list "-X" flycheck-ghc-language-extensions concat)
            (eval flycheck-ghc-args)
            "-x" (eval
                  (pcase major-mode
                    (`haskell-mode "hs")
                    (`literate-haskell-mode "lhs")))
            source)
  :error-patterns
  ((warning line-start (file-name) ":" line ":" column ":"
            (or " " "\n    ") "Warning:" (optional "\n")
            (message
             (one-or-more " ") (one-or-more not-newline)
             (zero-or-more "\n"
                           (one-or-more " ")
                           (one-or-more not-newline)))
            line-end)
   (error line-start (file-name) ":" line ":" column ":"
          (or (message (one-or-more not-newline))
              (and "\n"
                   (message
                    (one-or-more " ") (one-or-more not-newline)
                    (zero-or-more "\n"
                                  (one-or-more " ")
                                  (one-or-more not-newline)))))
          line-end))
  :error-filter
  (lambda (errors)
    (flycheck-sanitize-errors (flycheck-dedent-error-messages errors)))
  :modes (haskell-mode literate-haskell-mode)
  :next-checkers ((warning . haskell-hlint)))

(flycheck-define-checker haskell-ghcmod
   "A Haskell syntax and type checker using ghc-mod"
   :command ("ghc-mod" "check" source-inplace)
   :error-patterns
   ((warning line-start (file-name) ":" line ":" column ":"
             (or " " "\n    ") "Warning:" (optional "\n")
             (one-or-more " ")
             (message (one-or-more not-newline)
                      (zero-or-more "\n"
                                    (one-or-more " ")
                                    (one-or-more not-newline)))
             line-end)
    (error line-start (file-name) ":" line ":" column ":"
           (or (message (one-or-more not-newline))
               (and "\n" (one-or-more " ")
                    (message (one-or-more not-newline)
                             (zero-or-more "\n"
                                           (one-or-more " ")
                                           (one-or-more not-newline)))))
           line-end))
   :modes haskell-mode
   :next-checkers ((warnings-only . haskell-hlint)))
;; ghc-mod does not support cabal-1.22 and ghc-7.8.4
;(add-to-list 'flycheck-checkers 'haskell-ghcmod)

;(add-to-list 'flycheck-disabled-checkers 'haskell-ghc)
(add-to-list 'flycheck-checkers 'haskell-stack)

;;; CUSTOM KEYMAPS
(evil-leader/set-key-for-mode 'haskell-mode
  "h" 'haskell-hayoo
  "r" 'hsenv-jack-in
  "b" 'haskell-compile
  "c c" 'switch-to-haskell
  "c b" 'inferior-haskell-load-file)

;; (define-key evil-insert-state-map (kbd "C-<tab>") 'ghc-complete)
(define-key evil-normal-state-map (kbd "C-n") 'flycheck-next-error)

(add-hook 'haskell-mode-hook 'haskell-fix-imports)

(defun haskell-fix-imports ()
  (add-hook 'before-save-hook 'haskell-sort-imports)
  (add-hook 'before-save-hook 'haskell-align-imports)
)


(provide 'haskell-conf)
;;; haskell-conf.el ends here
