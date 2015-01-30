(setq ag-highlight-search t)
(setq ag-reuse-buffers t)

;; helm-ag
(setq helm-ag-insert-at-point 'symbol)

(defun my-helm-ag--query ()
  (let* ((searched-word (helm-ag--searched-word))
         (prompt
          (format "Search string%s: "
                  (if (and searched-word
                           (not (string-empty-p searched-word)))
                      (format " (default %s)" searched-word)
                    "")))
         (query (read-string prompt nil 'helm-ag--command-history)))
    (setq helm-ag--last-query query)))
(advice-add 'helm-ag--query :override 'my-helm-ag--query)

(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)
