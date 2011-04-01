;; loading stable version of cedet.
(load-file "~/.emacs.d/plugins/cedet/common/cedet.el")
(add-to-load-path "~/.emacs.d/plugins/malabar/lisp")
(require 'cedet)
;(global-ede-mode)
(semantic-load-enable-minimum-features)
(require 'malabar-mode)
(setq malabar-groovy-lib-dir "~/.emacs.d/plugins/malabar/lib")
(add-to-list 'auto-mode-alist '("\\.java$" . malabar-mode))