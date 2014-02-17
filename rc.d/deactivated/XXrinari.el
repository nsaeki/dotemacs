;; rinari
(add-to-list 'load-path "~/.emacs.d/plugins/rinari")
(require 'rinari)

;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/plugins/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))

(add-to-list 'auto-mode-alist '("\\.js\\.erb$" . js2-mode))
