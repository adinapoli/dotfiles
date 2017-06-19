
(require 'evil-leader)
(require 'evil)
(require 'org)

(evil-leader/set-key "oa" 'org-agenda)
(evil-leader/set-key-for-mode 'org-mode
  "ot" 'org-todo
  "os" 'org-schedule)

(install-and-require #'org-mac-iCal)

(defun org-mode-post-load-hook ()
  (setq org-log-done t)
  (add-to-list 'org-modules 'org-mac-iCal)
  (setq-default diary-file "~/Dropbox/notes/diary")
  (setq org-agenda-files (list
                           "~/Dropbox/notes/self-study.org"
                           "~/Dropbox/notes/todo.org"))
  (setq org-agenda-include-diary t)
  (org-mac-iCal))
(eval-after-load "org" '(org-mode-post-load-hook))

(setq calendar-date-style 'european)
(setq calendar-week-start-day 1)
(setq calendar-mark-holidays-flag t)

(setq calendar-date-style 'european)
(setq calendar-time-display-form
      '(24-hours ":" minutes (and time-zone (concat " (" time-zone ")"))))

(evil-define-key 'normal org-agenda-mode-map
  (kbd "RET") 'org-agenda-switch-to)

(evil-leader/set-key-for-mode 'org-mode
  "a" 'org-agenda-list
  "+" 'org-table-sum)

(setq uk-holidays
      '((holiday-fixed 1 1 "[UK] New Year's Day")
        (holiday-fixed 2 14 "[UK] Valentine's Day")
        (holiday-fixed 3 17 "[UK] St. Patrick's Day")
        (holiday-fixed 4 1 "[UK] April Fools' Day")
        (holiday-easter-etc -47 "[UK] Shrove Tuesday")
        (holiday-easter-etc -21 "[UK] Mother's Day")
        (holiday-easter-etc -2 "[UK] Good Friday")
        (holiday-easter-etc 0 "[UK] Easter Sunday")
        (holiday-easter-etc 1 "[UK] Easter Monday")
        (holiday-float 5 1 1 "[UK] Early May Bank Holiday")
        (holiday-float 5 1 -1 "[UK] Spring Bank Holiday")
        (holiday-float 6 0 3 "[UK] Father's Day")
        (holiday-float 8 1 -1 "[UK] Summer Bank Holiday")
        (holiday-fixed 10 31 "[UK] Halloween")
        (holiday-fixed 12 24 "[UK] Christmas Eve")
        (holiday-fixed 12 25 "[UK] Christmas Day")
        (holiday-fixed 12 26 "[UK] Boxing Day")
        (holiday-fixed 12 31 "[UK] New Year's Eve")))

(setq calendar-holidays (append uk-holidays ))
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;;; Calendar section
(install-and-require #'calfw)
(install-and-require #'calfw-gcal)
(load-and-use #'calfw-ical)
(load-and-use #'calfw-cal)
(load-and-use #'calfw-org)

(defun my-calendar-gather ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Green")  ; orgmode source
    (cfw:cal-create-source "Orange") ; diary source
    ;;(cfw:ical-create-source "Moon" "~/moon.ics" "Gray")  ; ICS source1
    ;;(cfw:ical-create-source "gcal" "https://..../basic.ics" "IndianRed") ; google calendar ICS
   ))) 

(evil-ex-define-cmd "cal" 'my-calendar-gather)

(provide 'org-conf)
;;; org-conf.el ends here
