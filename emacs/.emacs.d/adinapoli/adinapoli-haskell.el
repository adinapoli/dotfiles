;;; -*- lexical-binding: t -*-
;;; adinapoli-haskell.el --- Support for the haskell programming language

;; Copyright (C) 2016 Alfredo Di Napoli

;; Author: Alfredo Di Napoli <alfredo.dinapoli@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(adinapoli/install-and-require 'haskell-mode)
(adinapoli/install-and-require 'hindent)

(define-key evil-normal-state-map (kbd "C-n") 'flycheck-next-error)

(defun adinapoli/haskell-fix-imports ()
  (add-hook 'before-save-hook 'haskell-sort-imports)
  (add-hook 'before-save-hook 'haskell-align-imports))


;; Final entry point
(add-hook 'haskell-mode-hook (lambda ()
                               (progn
                                 (flycheck-select-checker 'haskell-stack-ghc)
                                 (flycheck-add-next-checker 'haskell-stack-ghc '(warning . haskell-hlint))
                                 )))
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'hindent-mode)
(add-hook 'haskell-mode-hook 'adinapoli/haskell-fix-imports)

(provide 'adinapoli-haskell)
;;; adinapoli-haskell.el ends here
