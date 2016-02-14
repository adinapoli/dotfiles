;;; -*- lexical-binding: t -*-
;;; adinapoli-window-layout.el --- Utility functions for use elsewhere.

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

(adinapoli/install-and-require 'shackle)
(shackle-mode)

;; Tame wild window splitting from flycheck by aligning them at
;; the bottom with a 25% split.
(setq shackle-rules '(
  ("*Flycheck error messages*" :noselect t :align 'below :size 0.25)
  ;; Display Ag search messages in the bottom
  ("\\`\\*ag search.*?\\*\\'" :regexp t :select t :align 'below :size 0.25)
))

;; Set Global Line Numbers.
(global-linum-mode 1)
(adinapoli/when-tui (progn (setq linum-format "  %2d  ")))

;; Set Columns
(setq column-number-mode t)

(provide 'adinapoli-window-layout)
;;; adinapoli-window-layout.el ends here
