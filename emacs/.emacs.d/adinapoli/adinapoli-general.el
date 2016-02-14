;;; -*- lexical-binding: t -*-
;;; adinapoli-general.el --- Utility functions for use elsewhere.

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

(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  )

(defun adinapoli/install-and-require (pkg)
  (when (not (package-installed-p pkg))
    (when (not (require pkg nil t))
      (progn
        (package-refresh-contents)
        (package-install pkg)))
    )
  (require pkg))

(defun adinapoli/buffer-mode (buffer-or-string)
  "Returns the major mode associated with a buffer."
  (with-current-buffer buffer-or-string
    major-mode))

(defun adinapoli/kill-all-buffers-by-mode (mode)
  (interactive)
  (let ((buffers (buffer-list)))
    (while buffers
      (when (string= mode (adinapoli/buffer-mode (car buffers)))
        (kill-buffer (car buffers)))
      (setq buffers (cdr buffers)))))

(defun adinapoli/kill-all-buffers ()
  "Kills all buffer, except the one with earmuffs."
  (interactive)
  (let ((buffers (buffer-list)))
    (while buffers
      (unless (string-match "*" (buffer-name (car buffers)))
        (kill-buffer (car buffers)))
      (setq buffers (cdr buffers)))))

(defun adinapoli/toggle-frame-fullscreen ()
  "Toggle fullscreen mode of the selected frame.
  Enable fullscreen mode of the selected frame or disable if it is
  already fullscreen.  Ignore window manager screen decorations.
  When turning on fullscreen mode, remember the previous value of the
  maximization state in the temporary frame parameter `maximized'.
  Restore the maximization state when turning off fullscreen mode.
  See also `toggle-frame-maximized'."
  (interactive)
  (modify-frame-parameters
    nil
    `((maximized
        . ,(unless (memq (frame-parameter nil 'fullscreen) '(fullscreen fullboth))
             (frame-parameter nil 'fullscreen)))
      (fullscreen
        . ,(if (memq (frame-parameter nil 'fullscreen) '(fullscreen fullboth))
             (if (eq (frame-parameter nil 'maximized) 'maximized)
               'maximized)
             'fullscreen)))))

(defun adinapoli/use-theme (theme theme-name)
  (when (not (package-installed-p theme))
    (package-install theme))
  (load-theme theme-name t))

(defun adinapoli/load-if-exist (path pkg)
  "Add a path to load path if exist and load the pkg"
  (progn
    (when (and (file-exists-p path) (not (member path 'load-path)))
      (add-to-list 'load-path path))
    (when (file-exists-p path) (require pkg))))

(defun adinapoli/load-and-use (pkg-name)
  (when (file-exists-p (format "%s/%s%s" "~/.emacs.d" pkg-name ".el"))
    (progn (load-file (format "%s/%s%s" "~/.emacs.d" pkg-name ".el"))
           (require pkg-name))))

(defun adinapoli/set-var-from-zsh (var-name)
  (let* ((read-cmd (format ". ~/.zshrc; echo -n $%s" var-name))
        (path (shell-command-to-string read-cmd)))
    (setenv var-name path)
    (setq exec-path
          (append
            (split-string-and-unquote path ":")
            exec-path))))

;; Execute the action when the system matches the given one
(defun adinapoli/when-os-is (os-type action)
  (when (eq system-type os-type) action))

(defun adinapoli/when-darwin (action) (adinapoli/when-os-is 'darwin action))
(defun adinapoli/when-gui    (action) (when (display-graphic-p) action))
(defun adinapoli/when-tui    (action) (when (not (display-graphic-p)) action))

(setq-default indent-tabs-mode nil)
(tool-bar-mode -1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(adinapoli/when-tui (menu-bar-mode -1))
(adinapoli/when-gui (lambda () (scroll-bar-mode -1)))
(setq visible-bell t)
(setq inhibit-splash-screen 1)

;;Set extra path to ZSH
;; This should set Emacs PATH using my ZSH PATh.
(adinapoli/set-var-from-zsh "PATH")
(adinapoli/set-var-from-zsh "DYLD_LIBRARY_PATH")

(provide 'adinapoli-general)
;;; adinapoli-general.el ends here
