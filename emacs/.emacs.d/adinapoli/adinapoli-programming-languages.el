;;; -*- lexical-binding: t -*-
;;; adinapoli-programming-languages.el --- Support for various programming languages.

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

(adinapoli/install-and-require 'evil)

;; Add facilities to improve my coding
(require 'whitespace)
(add-hook 'prog-mode-hook 'whitespace-mode)
(setq whitespace-style '(face lines-tail))
(setq whitespace-line-column 120)
(global-whitespace-mode t)

(defface adinapoli-tab-face
  '((((class color)) (:background "grey10"))) t
  :group 'basic-faces
  )
(defface adinapoli-trailing-space-face
  '((((class color)) (:background "#FFCCFF"))) t
  :group 'basic-faces
  )

;;; Shows the training whitespaces and tab when programming.
(defun adinapoli/show-whitespace-tokens ()
  ;; Do not manipulate the Colors buffer that we get when doing `list-colors-display`.
  (unless (or (string= (buffer-name) "*Colors*")
              (string= (buffer-name) "*terminal*")
              (string= (buffer-name) "*Completions*")
              )
    (font-lock-add-keywords nil '(("\t+" (0 'adinapoli-tab-face t))
                                  ("[ \t]+$" (0 'adinapoli-trailing-space-face t))))
  ))
(add-hook 'font-lock-mode-hook 'adinapoli/show-whitespace-tokens)

;; "Primary" programming languages
(require 'adinapoli-go)
(require 'adinapoli-python)
(require 'adinapoli-haskell)
(require 'adinapoli-purescript)
(require 'adinapoli-rust)
(require 'adinapoli-html)
(require 'adinapoli-elm)

;; "Secondary" programming languages which does not require extra configs.
(adinapoli/install-and-require 'yaml-mode)
(adinapoli/install-and-require 'markdown-mode)

(provide 'adinapoli-programming-languages)
;;; adinapoli-programming-languages.el ends here
