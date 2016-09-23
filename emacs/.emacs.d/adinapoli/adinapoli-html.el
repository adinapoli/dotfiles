;;; -*- lexical-binding: t -*-
;;; adinapoli-html.el --- Support for HTML

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

(adinapoli/install-and-require 'emmet-mode)

(defun adinapoli/emmet-expand ()
  (progn
    (define-key evil-normal-state-map (kbd "TAB") 'emmet-expand-line)
    (define-key evil-normal-state-map (kbd "<tab>") 'emmet-expand-line)
    (define-key evil-insert-state-map (kbd "TAB") 'emmet-expand-line)
    (define-key evil-insert-state-map (kbd "<tab>") 'emmet-expand-line)
    )
  )

(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'emmet-mode-hook 'adinapoli/emmet-expand)

(provide 'adinapoli-html)
;;; adinapoli-html.el ends here
