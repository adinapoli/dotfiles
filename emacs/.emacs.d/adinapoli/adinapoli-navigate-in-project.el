;;; -*- lexical-binding: t -*-
;;; adinapoli-navigate-in-project.el --- Support for Navigating Source Code swiftly.

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
(adinapoli/install-and-require 'evil-leader)
(adinapoli/install-and-require 'neotree)
(adinapoli/install-and-require 'ctags-update)

(evil-leader/set-key "nt" 'neotree-toggle)

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; Ctags
(defun regenerate-tags ()
  (interactive)
  (let ((tags-directory (directory-file-name (projectile-project-root))))
    (shell-command
     (format "ctags -f %s -e -R %s" tags-file-name tags-directory))))

;;(add-hook 'haskell-mode-hook 'turn-on-ctags-auto-update-mode)

(define-key evil-normal-state-map (kbd "gf") (lambda () (interactive) (find-tag (find-tag-default-as-regexp))))
(define-key evil-normal-state-map (kbd "gb") 'pop-tag-mark)
(define-key evil-normal-state-map (kbd "gn") (lambda () (interactive) (find-tag last-tag t)))

(provide 'adinapoli-navigate-in-project)
;;; adinapoli-navigate-in-project.el ends here
