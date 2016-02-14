;;; -*- lexical-binding: t -*-
;;; adinapoli-evil.el --- Evil config.

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
(adinapoli/install-and-require 'elscreen)
(adinapoli/install-and-require 'undo-tree)
(global-undo-tree-mode)

(setq evil-leader/in-all-states t)
(setq evil-leader/leader ",")
(global-evil-leader-mode 1)
(evil-mode 1)

(evil-set-toggle-key "C-a")
(setq evil-default-state 'normal)

(evil-define-command adinapoli/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
                           nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
        (delete-char -1)
        (set-buffer-modified-p modified)
        (push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
                                              (list evt))))))))


;; Fix the problem if the buffer is readonly. The problem is
;; that (interactive) signals an error when the buffer name starts with *
;; This is a backdoorish hack.
(add-hook 'evil-local-mode-hook (lambda ()
                                  (when buffer-read-only (evil-normal-state))))

(setq evil-normal-state-tag   (propertize "N" 'face '((:background "green" :foreground "black")))
      evil-emacs-state-tag    (propertize "E" 'face '((:background "orange" :foreground "black")))
      evil-insert-state-tag   (propertize "I" 'face '((:background "red")))
      evil-motion-state-tag   (propertize "M" 'face '((:background "blue")))
      evil-visual-state-tag   (propertize "V" 'face '((:background "grey80" :foreground "black")))
      evil-operator-state-tag (propertize "O" 'face '((:background "purple"))))



;; Do not depend an bcycle as it's not on MELPA.
(defvar adinapoli/skip-patterns '("^\s*\\*" "^\s*%"))

(defun adinapoli/matches-regexp (str regexp-list)
  "Return non-nil if str matches anything in regexp-list."
  (loop for regexp in regexp-list thereis (string-match regexp str)))

(defun adinapoli/next-buffer ()
  "Goes to the next buffer that doesn't match any exclusion patterns."
  (interactive)
  (let ((curr-bname (buffer-name (current-buffer))))
    (next-buffer)
    (while (and
            (adinapoli/matches-regexp (buffer-name (current-buffer)) adinapoli/skip-patterns)
            (not (equal curr-bname (buffer-name (current-buffer)))))
      (next-buffer))))

(defun adinapoli/previous-buffer ()
  "Goes to the previous buffer that doesn't match any exclusion patterns."
  (interactive)
  (let ((curr-bname (buffer-name (current-buffer))))
    (previous-buffer)
    (while (and
            (adinapoli/matches-regexp (buffer-name (current-buffer)) adinapoli/skip-patterns)
            (not (equal curr-bname (buffer-name (current-buffer)))))
      (previous-buffer))))

(defun adinapoli/safe-kill-buffer ()
   "Kill current buffer just if not modified."
   (interactive)
     (if (buffer-modified-p)
         (message "Can't kill buffer: Buffer was modified!")
     (kill-buffer (current-buffer))))

(defun adinapoli/safe-kill-buffer-and-screen ()
  (interactive)
  (if (buffer-modified-p)
      (message "Can't kill screen: Buffer was modified!")
    (progn
      (adinapoli/safe-kill-buffer)
      (elscreen-kill))))

;; Select when starting in Emacs rather than Evil.
(cl-loop for (mode . state) in '((shell-mode                   . emacs)
                                 (term-mode                    . emacs)
                                 (notmuch-show-mode            . normal)
                                 (notmuch-search-mode          . normal)
                                 (nav-mode                     . normal)
                                 (org-agenda-mode              . normal)
                                 (erc-mode                     . normal))
         do (evil-set-initial-state mode state))

;; Extra ex command bindings
;; A more effective bd
(evil-ex-define-cmd "bd" 'adinapoli/safe-kill-buffer-and-screen)
(evil-ex-define-cmd "Bk" 'adinapoli/kill-all-buffers)
(evil-ex-define-cmd "Mx" 'execute-extended-command)
(evil-ex-define-cmd "bk" (lambda () (interactive) (kill-buffer (current-buffer))))

;; Extra key bindings
;; Better navigation between windows
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-page-up)
(define-key evil-insert-state-map "j" #'adinapoli/maybe-exit)
(define-key evil-normal-state-map (kbd "H") 'adinapoli/previous-buffer)
(define-key evil-normal-state-map (kbd "L") 'adinapoli/next-buffer)
;; M-x via "\" in terminal
(define-key evil-normal-state-map (kbd "\\") 'execute-extended-command)
(define-key evil-visual-state-map (kbd "gv") 'exchange-point-and-mark)
(define-key evil-normal-state-map "u" 'undo-tree-undo)
(define-key evil-normal-state-map "\C-r" 'undo-tree-redo)
;; Shrink windows, vim style
(global-set-key (kbd "C-S-H") 'shrink-window-horizontally)
(global-set-key (kbd "C-S-L") 'enlarge-window-horizontally)
(global-set-key (kbd "C-S-K") 'shrink-window)
(global-set-key (kbd "C-S-J") 'enlarge-window)

(provide 'adinapoli-evil)
;;; adinapoli-evil.el ends here
