(ensure-package-installed 'org)
(require 'org)
(setq org-startup-folded 'content)
(setq org-directory "~/org")
(setq org-agenda-files (list org-directory))
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-capture-templates
      '(("n" "Notes" entry (file org-default-notes-file)
             "* %?\n  %U\n  %a")))

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

(setq org-journal-directory (concat org-directory "/journal"))
(push org-journal-directory org-agenda-files)
(defun org-open-journal-file
  nil
  (interactive)
  ;; (let ((basename (read-string "Open org file with basename: ")))
  ;;   (find-file (concat org-directory
  ;;                      (when (> (length basename) 0)
  ;;                        (concat basename "-"))
  ;;                      (format-time-string "%Y%m%d")
  ;;                      ".org")))
  (find-file (concat org-journal-directory "/"
                     (format-time-string "%Y%m%d")
                     ".org"))
  (goto-char (point-max))
  (org-show-entry))

;; overwrites default: <C-return>      org-insert-heading-respect-content
;(define-key org-mode-map (kbd "<C-return>") 'org-insert-heading-dwim)

;; disables C-, and C-'
(define-key org-mode-map (kbd "C-,") nil)
(define-key org-mode-map (kbd "C-'") nil)
(define-key org-mode-map (kbd "C-c a") 'org-agenda)
;; (define-key global-map (kbd "C-c k") 'org-capture)
(define-key global-map (kbd "C-c j") 'org-open-journal-file)
;; (define-key global-map "\C-cn"
;;   (lambda () (interactive) (org-capture nil "n")))

;; ORGMODE-markdown
;; https://github.com/alexhenning/ORGMODE-Markdown
(load "org-export-generic.el")
(load "org-export-markdown.el")
