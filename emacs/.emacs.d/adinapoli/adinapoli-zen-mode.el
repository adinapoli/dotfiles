;;; -*- lexical-binding: t -*-
;;; adinapoli-zen-mode.el --- A mode for who do not want to be distracted.

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

(require 'evil-leader)
(require 'adinapoli-general)

;; Hide the mode line (required by Zen Mode)
(defvar-local adinapoli/zen-ml-mode nil)
(defvar-local hide-mode-line nil)

(define-minor-mode adinapoli/zen-ml-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global nil
  :variable adinapoli/zen-ml-mode
  :group 'editing-basics
  (if adinapoli/zen-ml-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             adinapoli/zen-ml-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x adinapoli/zen-ml-mode to make the mode-line appear."))))

;; Zen Mode is disabled by default.
(defvar adinapoli/zen-mode-enabled nil)

(defun adinapoli/enable-zen-mode ()
   (progn
     (global-linum-mode 0)
     (adinapoli/zen-ml-mode 1)
     ;;(setq elscreen-display-tab nil)
     (setq adinapoli/zen-mode-enabled 1)
     (if (eq nil window-system)
       (set-window-margins (selected-window) (/ (display-pixel-width) 4) 0)
       (set-window-margins (selected-window) (/ (display-pixel-width) 40) 0)
     )
     (redraw-display)
     (message "Zen Mode enabled.")))

(defun adinapoli/disable-zen-mode ()
   (progn
     (global-linum-mode 1)
     (adinapoli/zen-ml-mode 0)
     ;;(elscreen-toggle-display-tab)
     (setq adinapoli/zen-mode-enabled nil)
     (redraw-display)
     (message "Zen Mode disabled.")))

(defun adinapoli/zen-mode-core ()
  (if adinapoli/zen-mode-enabled
   (adinapoli/disable-zen-mode)
   (adinapoli/enable-zen-mode)))

;; Zen Mode
;; Hides everything if I want
(defun adinapoli/zen-mode ()
 (interactive)
 (adinapoli/zen-mode-core))

(evil-leader/set-key "zm" 'adinapoli/zen-mode)

(provide 'adinapoli-zen-mode)
;;; adinapoli-zen-mode.el ends here
