(ensure-package-installed 'auto-highlight-symbol 'highlight-symbol)
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;; (require 'highlight-symbol)
;; (global-set-key (kbd "C-,") 'highlight-symbol-at-point)
;; (global-set-key (kbd "C-M-,") 'highlight-symbol-remove-all)
