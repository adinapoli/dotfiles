
(require 'util)
(require 'evil-leader)
(require 'evil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Spell checking and languages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(install-and-require #'flyspell-lazy)
(flyspell-lazy-mode 1)
(setq ispell-list-command "--list")
(let ((langs '("british" "italiano")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))
(defun cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))
(global-set-key [f6] 'cycle-ispell-languages)
(evil-ex-define-cmd "spell" (lambda () 
                              (interactive)
                              (progn
                                (funcall 'flyspell-mode)
                                (funcall 'flyspell-buffer))))

(evil-ex-define-cmd "nospell" (lambda () (interactive) (flyspell-mode 0)))
(evil-ex-define-cmd "spell-correct" 'flyspell-auto-correct-word)
(evil-ex-define-cmd "spell-cycle" 'cycle-ispell-languages)
(install-and-require 'google-translate)
(evil-leader/set-key "go" 'google-translate-at-point)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'language-conf)
;;; org-conf.el ends here
