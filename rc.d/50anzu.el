(ensure-package-installed 'anzu)
(require 'anzu)
(global-anzu-mode t)
(global-set-key (kbd "C-c q") 'anzu-query-replace)
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c t") 'anzu-query-replace-at-cursor-thing)
