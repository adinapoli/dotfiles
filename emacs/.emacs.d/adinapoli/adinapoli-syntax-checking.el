;;; -*- lexical-binding: t -*-
;;; adinapoli-syntax-checking.el --- Utility functions for use in Mac OS X.

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
(adinapoli/install-and-require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Better colours
(set-face-attribute 'flycheck-error   nil :background "#A00000")
(set-face-attribute 'flycheck-error   nil :foreground "white")
(set-face-attribute 'flycheck-warning nil :background "blue")
(set-face-attribute 'flycheck-warning nil :foreground "white")

(provide 'adinapoli-syntax-checking)
;;; adinapoli-syntax-checking.el ends here
