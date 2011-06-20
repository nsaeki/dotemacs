(add-hook 'java-mode-hook '(lambda () (camelCase-mode 1)))

;;; malabar-mode
; (add-to-load-path-recompile "~/.emacs.d/plugins/malabar/lisp")
; (add-hook 'java-mode-hook '(lambda () (camelCase-mode 1)))
; (semantic-mode 1)
; (require 'malabar-mode)
; (setq malabar-groovy-lib-dir "~/.emacs.d/plugins/malabar/lib")
; (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; (add-hook 'malabar-mode-hook
;;           (lambda () 
;;             (add-hook 'after-save-hook 'malabar-compile-file-silently
;;                       nil t)))

