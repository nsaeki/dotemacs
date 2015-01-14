(setq org-startup-folded 'nofold)
(setq org-directory "~/org")
(setq org-agenda-files (list org-directory))
(define-key org-mode-map (kbd "C-'") nil)

(setq org-default-capture-file (concat org-directory "/capture.org"))
(setq org-capture-templates
      '(("n" "Note" entry (file org-default-capture-file)
         "* %?\n\  %i\n\n  %U\n  [[%F]]")))

(setq org-capture-templates
      '(("n" "Note" entry (file org-default-capture-file)
         "* %?\n  %U\n  %a")))

(defun my-org-insert-upheading (arg)
  "insert upheading"
  (interactive "P")
  (org-insert-heading arg)
  (cond ((org-on-heading-p) (org-do-promote))
        ((org-at-item-p) (org-indent-item -1))))

(defun my-org-insert-heading-dwim (arg)
  nil
  (interactive "p")
  (case arg
    (4  (org-insert-subheading nil))    ; C-u
    (16 (org-insert-upheading nil))     ; C-u C-u
    (t  (org-insert-heading nil))))

(setq org-notes-directory (concat org-directory "/notes"))
(push org-notes-directory org-agenda-files)

(defun my-org-open-notes
  nil
  (interactive)
  (find-file (concat org-notes-directory "/"
                     (format-time-string "%Y%m%d")
                     ".org"))
  (goto-char (point-max))
  (org-show-entry))

(defun my-org-open-notes-with-name
  nil
  (interactive)
  (let ((notename (read-string "Open org file with name: "
                               (concat (format-time-string "%Y%m%d")
                                       "-"))))
    (find-file (concat org-notes-directory "/" notename ".org"))
    (goto-char (point-max))
    (org-show-entry)))

(defun my-org-quick-note
    nil
  (interactive)
  (let* ((current-org-capture-file
          (concat org-notes-directory "/"
                  (format-time-string "%Y%m%d")
                  ".org"))
         (org-capture-templates
          '(("c" "Capture" entry (file+headline current-org-capture-file "Capture")
             "* %?\n\n  %i\n\n  %U\n  [[%F]]")))
         (org-capture-entry (org-capture-select-template  "c")))
    (org-capture)))
