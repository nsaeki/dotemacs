(setq org-startup-folded 'nofold)
(setq org-directory "~/notes")
(setq org-agenda-files (list org-directory))
(setq org-default-notes-file (concat org-directory "/scribble.org"))

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

(setq my/org-journal-directory (concat org-directory "/journal"))
(push my/org-journal-directory org-agenda-files)

(setq org-capture-templates
      '(("n" "Add new item to default note file." entry (file nil)
         "* %?\n%i\n\n  %T\n  %a"
         :empty-lines 1)
        ))

(defun my/org-open-journal (&optional filename)
  (interactive)
  (let ((filename (or filename (format-time-string "%Y%m%d"))))
    (find-file (concat my/org-journal-directory "/" filename ".org"))
    (goto-char (point-max))
    (org-show-entry)))

(defun my/org-open-journal-with-title (&optional title)
  (interactive)
  (let ((filename (if title (concat (format-time-string "%Y%m%d-") title)
                (read-string "Open journal file with name: "
                             (format-time-string "%Y%m%d-")))))
    (my/org-open-journal filename)))

(defun my/org-quick-capture ()
  (interactive)
  (org-capture nil "n"))
