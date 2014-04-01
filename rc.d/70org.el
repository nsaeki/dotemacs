(require 'org)
(setq org-startup-folded 'content)
(setq org-directory "~/notes/")

;; org-remember
;; (org-remember-insinuate)
;; ;; (setq org-directory "~/notes/")
;; (setq org-default-notes-file (expand-file-name "memo.org" org-directory))
;; (setq org-remember-templates
;;       '(("Note" ?n "** %?\n   %i\n   %a\n   %T" nil "Inbox")
;; ;        ("Todo" ?t "** TODO %?\n   %i\n   %a   %T\n" nil "Inbox")
;;        ))
;; (defalias 'memo 'org-remember)

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

(defun org-open-today-file
  nil
  (interactive)
  (let ((basename (read-string "Open org file with basename: ")))
    (find-file (concat org-directory
                       (when (> (length basename) 0)
                         (concat basename "-"))
                       (format-time-string "%Y%m%d")
                       ".org")))
    ;; (find-file (concat org-directory
    ;;                    (format-time-string "%Y%m%d")
    ;;                    ".org"))
  (goto-char (point-max))
  (org-show-entry))

;; overwrites default: <C-return>      org-insert-heading-respect-content
;(define-key org-mode-map (kbd "<C-return>") 'org-insert-heading-dwim)

;; disables C-, and C-'
(define-key org-mode-map (kbd "C-,") nil)
(define-key org-mode-map (kbd "C-'") nil)
(define-key org-mode-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c m") 'org-open-today-file)

;; ORGMODE-markdown
;; https://github.com/alexhenning/ORGMODE-Markdown
(load "org-export-generic.el")
(load "org-export-markdown.el")
