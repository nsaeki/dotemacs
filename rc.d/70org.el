(setq org-startup-folded 'nofold)
(setq org-directory "~/org")
(setq org-agenda-files (list org-directory))

(define-key org-mode-map (kbd "C-'") nil)
(define-key global-map (kbd "C-c a") 'org-agenda)

(setq org-default-capture-file (concat org-directory "/capture.org"))
(setq org-capture-templates
      '(("n" "Note" entry (file org-default-capture-file)
             "* %?\n  %U\n  %a")))

(define-key global-map (kbd "C-c m")
  (lambda () (interactive) (org-capture nil "n")))

(defun org-insert-upheading (arg)
  "insert upheading"
  (interactive "P")
  (org-insert-heading arg)
  (cond ((org-on-heading-p) (org-do-promote))
        ((org-at-item-p) (org-indent-item -1))))

(defun org-insert-heading-dwim (arg)
  nil
  (interactive "p")
  (case arg
    (4  (org-insert-subheading nil))    ; C-u
    (16 (org-insert-upheading nil))     ; C-u C-u
    (t  (org-insert-heading nil))))

(setq org-notes-directory (concat org-directory "/notes"))
(push org-notes-directory org-agenda-files)
(defun org-open-notes
  nil
  (interactive)
  (find-file (concat org-notes-directory "/"
                     (format-time-string "%Y%m%d")
                     ".org"))
  (goto-char (point-max))
  (org-show-entry))

(defun org-open-notes-with-name
  nil
  (interactive)
  (let ((notename (read-string "Open org file with name: ")))
    (find-file (concat org-notes-directory "/"
                       (format-time-string "%Y%m%d")
                       (when (> (length notename) 0)
                         (concat "-" notename))
                       ".org")))
  (goto-char (point-max))
  (org-show-entry))

(define-key global-map (kbd "C-c n") 'org-open-notes)
