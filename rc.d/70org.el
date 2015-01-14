(setq org-startup-folded 'nofold)
(setq org-directory "~/org")
(setq org-agenda-files (list org-directory))

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

(setq my-org-notes-directory (concat org-directory "/journal"))
(push my-org-notes-directory org-agenda-files)

(setq org-capture-templates
      '(("n" "Add to today's note" entry
         (file+headline (my-org-current-note) "Capture")
         "* %?\n%i\n\n  %T\n  %a"
         ;; TODO: this does not work
         '((:empty-lines 1))
         )
        ("i" "Add to default capture file" entry (file)
         "* %?\n%i\n\n  %T\n  %a")))

(defun my-org-current-note ()
  "Returns today's note file path as YYYYMMDD.org"
  (concat my-org-notes-directory "/" (format-time-string "%Y%m%d") ".org"))

(defun my-org-open-note ()
  "Open today's notes file"
  ;; TODO: With integer arguments, open previous file in notes dir.
  ;; 0 means today (default) and -1 means previous file.
  ;; C-u has same effect.
  (interactive)
  (find-file (my-org-current-note))
  (goto-char (point-max))
  (org-show-entry))

(defun my-org-open-note-with-name ()
  nil
  (interactive)
  (let ((notename (read-string "Open note file with name: "
                               (concat (format-time-string "%Y%m%d")
                                       "-"))))
    (find-file (concat my-org-notes-directory "/" notename ".org"))
    (goto-char (point-max))
    (org-show-entry)))

(defun my-org-quick-note ()
  "Insert new entry to current note."
  (interactive)
  (org-capture nil "n"))
