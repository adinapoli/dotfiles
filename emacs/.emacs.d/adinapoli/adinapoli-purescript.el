;;; -*- lexical-binding: t -*-
;;; adinapoli-purescript.el --- Support for Purescript

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

(adinapoli/install-and-require 'purescript-mode)

(add-hook 'purescript-mode-hook 'purescript-indentation-mode)
;; PureScript main editing mode key bindings.
(defun purescript-hook ()
  ;; Use simple indentation.
  (turn-on-purescript-simple-indent))

(provide 'adinapoli-purescript)
;;; adinapoli-purescript.el ends here
