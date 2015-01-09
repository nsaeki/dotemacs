(setq ag-highlight-search t)
(setq ag-reuse-buffers t)
(setq helm-ag-insert-at-point 'symbol)

(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)
