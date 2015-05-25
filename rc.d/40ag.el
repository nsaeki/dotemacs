(setq ag-highlight-search t)
(setq ag-reuse-buffers t)
;; (setq helm-ag-insert-at-point 'symbol)

(add-hook 'ag-mode-hook 'wgrep-ag-setup)
(eval-after-load 'ag
  '(progn
     (define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode)))
