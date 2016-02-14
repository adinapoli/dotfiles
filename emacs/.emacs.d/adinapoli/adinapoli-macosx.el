;;; -*- lexical-binding: t -*-
;;; adinapoli-macosx.el --- Utility functions for use in Mac OS X.

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

(defun adinapoli/clipboard-copy ()
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) "pbcopy"))

(defun adinapoli/clipboard-paste ()
  "Paste data from pasteboard."
  (interactive)
  (shell-command-on-region
    (point)
    (if mark-active (mark) (point))
    "pbpaste" nil t))

(evil-ex-define-cmd "cp" 'adinapoli/clipboard-copy)
(evil-ex-define-cmd "paste" 'adinapoli/clipboard-paste)

(provide 'adinapoli-macosx)
;;; adinapoli-macosx.el ends here
