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

(adinapoli/install-and-require 'elscreen)
(adinapoli/install-and-require 'evil)
(elscreen-start)

(define-key evil-normal-state-map "\C-t" 'elscreen-create)
(define-key evil-motion-state-map "t" 'elscreen-next)
(define-key evil-motion-state-map "T" 'elscreen-previous)

;(set-face-attribute 'elscreen-tab-background-face  nil :background "blue")
;(set-face-attribute 'elscreen-tab-background-face  nil :foreground "black")
(set-face-attribute 'elscreen-tab-current-screen-face  nil :background "green")
(set-face-attribute 'elscreen-tab-current-screen-face  nil :foreground "white")
(set-face-attribute 'elscreen-tab-other-screen-face    nil :background "white")
(set-face-attribute 'elscreen-tab-other-screen-face    nil :foreground "black")

(provide 'adinapoli-elscreen)
;;; adinapoli-elscreen.el ends here
