;;; -*- lexical-binding: t -*-
;;; adinapoli-rust.el --- Support for the Rust programming language

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

;;; Take inspiration from: http://julienblanchard.com/2016/fancy-rust-development-with-emacs/

(adinapoli/install-and-require 'rust-mode)
;;(adinapoli/install-and-require 'cargo)
;;(add-hook 'rust-mode-hook 'cargo-minor-mode)
(adinapoli/install-and-require 'flycheck-rust)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;;(add-hook 'before-save-hook #'rust-format-buffer)

(provide 'adinapoli-rust)
;;; adinapoli-rust.el ends here
