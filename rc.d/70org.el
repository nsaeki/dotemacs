(setq org-startup-folded 'nofold)
(setq org-imenu-depth 4)

(define-key org-mode-map (kbd "C-'") nil)
(define-key org-mode-map (kbd "C-c a") 'org-agenda)

(defun org-insert-upheading (arg)
  "insert upheading"
  (interactive "P")
  (org-insert-heading arg)
  (cond ((org-on-heading-p) (org-do-promote))
        ((org-at-item-p) (org-indent-item -1))))

(defun org-insert-heading-dwim (arg)
  nil
  (interactive "P")
  (case arg
    (4  (org-insert-subheading nil))    ; C-u
    (16 (org-insert-upheading nil))     ; C-u C-u
    (t  (org-insert-heading nil))))


;;; org-journal
(require 'org-journal)
(setq org-journal-file-format "%Y%m%d.org")
(setq org-journal-date-format "%F")
(setq org-journal-time-format "<%Y-%m-%d %R> ")
(setq org-journal-dir "~/notes/journal")
(push org-journal-dir org-agenda-files)

;;; ox-gfm (auto required)
;; (require 'ox-gfm)

;;; org-capture
(setq org-capture-templates
      '(("n" "Add new item to default note file." entry (file nil)
         "* %?\n%i\n\n  %T\n  %a"
         :empty-lines 1)
        ))

(defun my/org-quick-capture ()
  (interactive)
  (org-capture nil "n"))
