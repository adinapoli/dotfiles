
(require 'util)

;;; Code:
(install-and-require #'tuareg)
(load-and-use 'merlin)


(defun opam-load (branch pkg)
  "Load a particular mode from Opam."
  (let ((path (format "/Users/adinapoli/.opam/%s/share/emacs/site-lisp/" branch)))
      (progn
      (when (and (file-exists-p path) (not (member path 'load-path)))
        (add-to-list 'load-path path))
      (when (file-exists-p path) (require pkg)))))

(opam-load "4.01.0dev+trunk" #'merlin)
(opam-load "4.01.0dev+trunk" #'utop)


(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq utop-command "opam config exec \"utop -emacs\"")
(autoload 'utop "utop" "Toplevel for OCaml" t)
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)


(provide 'ocaml-conf)
;;; ocaml-conf.el ends here
