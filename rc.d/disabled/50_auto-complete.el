;; package: auto-complete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (define-key ac-mode-map (kbd "M-/") 'auto-complete)
  (ac-config-default))

;; fixed auto-complete-config.el to work with yasnippet 0.6.1c
(defun ac-yasnippet-candidate-1 (table)
  (with-no-warnings
    (let ((hashtab (ac-yasnippet-table-hash table))
          (parent (yas/snippet-table-parents table))
          candidates)
      (maphash (lambda (key value)
                 (push key candidates))
               hashtab)
      (setq candidates (all-completions ac-prefix (nreverse candidates)))
      (when parent
        (mapc (lambda (table)
                (setq candidates
                      (append candidates (ac-yasnippet-candidate-1 table))))
              parent))
      candidates)))

;;(global-set-key "\M-/" 'auto-complete)
(setq ac-use-menu-map t)
