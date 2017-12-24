;;; -*- lexical-binding: t -*-
;;; adinapoli-find-in-project.el --- Utility functions to find stuff in projects.

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
(adinapoli/install-and-require 'helm)
(adinapoli/install-and-require 'async)
(adinapoli/install-and-require 'projectile)
(adinapoli/install-and-require 'helm-projectile)
(adinapoli/install-and-require 'helm-themes)
(adinapoli/install-and-require 'grizzl)

;; https://emacs.stackexchange.com/questions/29096/how-to-sort-directories-first-in-dired
(setq dired-use-ls-dired  nil)

(require 'helm-config)
(setq helm-ff-lynx-style-map nil
      helm-input-idle-delay 0.1
      helm-idle-delay 0.1
      helm-quick-update t)

(setq projectile-require-project-root nil)
(projectile-global-mode)
(setq projectile-show-paths-function 'projectile-hashify-with-relative-paths)

;; Prevent Emacs from auto-changing my working directory
;; when opening a new file. Prevent helm from running
;; inside ~
(defvar saved-default-directory default-directory)
(defun find-file-dont-change-directory ()
    (interactive)
    (if (string= default-directory "~/")
        (message "You can't projectile in the home.")
        (progn
            (setq saved-default-directory default-directory)
            (dired default-directory)
            (message "Starting helm-projectile")
            (helm-projectile)
            (adinapoli/kill-all-buffers-by-mode "dired-mode")
            (setq default-directory saved-default-directory))))

(setq projectile-completion-system 'grizzl)
(setq projectile-indexing-method 'alien)

(define-key evil-normal-state-map (kbd "C-p") 'find-file-dont-change-directory)
(define-key evil-normal-state-map (kbd "C-b") 'helm-buffers-list)

(provide 'adinapoli-find-in-project)
;;; adinapoli-find-in-project.el ends here
