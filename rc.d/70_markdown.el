;; https://gist.github.com/1631630
(progn
  ;; markdown-mode
  (custom-set-faces
   '(markdown-header-face-1 ((t (:inherit outline-1 :weight bold))))
   '(markdown-header-face-2 ((t (:inherit outline-2 :weight bold))))
   '(markdown-header-face-3 ((t (:inherit outline-3 :weight bold))))
   '(markdown-header-face-4 ((t (:inherit outline-4 :weight bold))))
   '(markdown-header-face-5 ((t (:inherit outline-5 :weight bold))))
   '(markdown-header-face-6 ((t (:inherit outline-6 :weight bold))))
   '(markdown-pre-face ((t (:inherit org-formula))))))

(defun markdown-imenu-create-index ()
  (let* ((root '(nil . nil))
         cur-alist
         (cur-level 0)
         (pattern "^\\(\\(#+\\)[ \t]*\\(.+\\)\\|\\([^# \t\n=-].*\\)\n===+\\|\\([^# \t\n=-].*\\)\n---+\\)$")
         (empty-heading "-")
         (self-heading ".")
         hashes pos level heading)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward pattern (point-max) t)
        (cond
         ((setq hashes (match-string-no-properties 2))
          (setq heading (match-string-no-properties 3)
                pos (match-beginning 1)
                level (length hashes)))
         ((setq heading (match-string-no-properties 4))
          (setq pos (match-beginning 4)
                level 1))
         ((setq heading (match-string-no-properties 5))
          (setq pos (match-beginning 5)
                level 2)))
        (let ((alist (list (cons heading pos))))
          (cond
           ((= cur-level level)		; new sibling
            (setcdr cur-alist alist)
            (setq cur-alist alist))
           ((< cur-level level)		; first child
            (dotimes (i (- level cur-level 1))
              (setq alist (list (cons empty-heading alist))))
            (if cur-alist
                (let* ((parent (car cur-alist))
                       (self-pos (cdr parent)))
                  (setcdr parent (cons (cons self-heading self-pos) alist)))
              (setcdr root alist))		; primogenitor
            (setq cur-alist alist)
            (setq cur-level level))
           (t				; new sibling of an ancestor
            (let ((sibling-alist (last (cdr root))))
              (dotimes (i (1- level))
                (setq sibling-alist (last (cdar sibling-alist))))
              (setcdr sibling-alist alist)
              (setq cur-alist alist))
            (setq cur-level level)))))
      (cdr root))))

(add-hook 'markdown-mode-hook
          '(lambda ()
             (setq imenu-create-index-function 'markdown-imenu-create-index)
             (local-set-key (kbd "C-M-m") 'markdown-insert-list-item)))
