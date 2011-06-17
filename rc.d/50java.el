(add-hook 'java-mode-hook '(lambda () (camelCase-mode 1)))

;;; malabar-mode
(add-to-load-path-recompile "~/.emacs.d/plugins/malabar/lisp")
(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)
(require 'malabar-mode)
(setq malabar-groovy-lib-dir "~/.emacs.d/plugins/malabar/lib")
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; (add-hook 'malabar-mode-hook
;;           (lambda () 
;;             (add-hook 'after-save-hook 'malabar-compile-file-silently
;;                       nil t)))
