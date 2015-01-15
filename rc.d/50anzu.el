(require 'anzu)
(global-anzu-mode t)
(set-face-attribute 'anzu-mode-line nil
                    :foreground "#066" :weight 'bold)

(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-use-migemo t)
 '(anzu-search-threshold 1000))
