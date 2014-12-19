(require 'anzu)
(global-anzu-mode t)
(global-set-key (kbd "C-c q") 'anzu-query-replace)
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c s") 'anzu-query-replace-at-cursor-thing)

(set-face-attribute 'anzu-mode-line nil
                    :foreground "#0aa" :weight 'bold)

(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-use-migemo t)
 '(anzu-search-threshold 1000))
