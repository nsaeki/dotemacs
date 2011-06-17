(require 'python)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; flymake for python
;; http://tech.lampetty.net/tech/index.php/archives/380
;; (require 'flymake)
;; (defun flymake-python-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "pyflakes" (list local-file))))
 
;; (defconst flymake-allowed-python-file-name-masks
;;   '(("\\.py$" flymake-python-init)))
;; (defvar flymake-python-err-line-patterns
;;   '(("\\(.*\\):\\([0-9]+\\):\\(.*\\)" 1 2 nil 3)))
 
;; (defun flymake-python-load ()
;;   (interactive)
;;   (defadvice flymake-post-syntax-check
;;     (before flymake-force-check-was-interrupted)
;;     (setq flymake-check-was-interrupted t))
;;   (ad-activate 'flymake-post-syntax-check)
;;   (setq flymake-allowed-file-name-masks
;;         (append flymake-allowed-file-name-masks
;;                 flymake-allowed-python-file-name-masks))
;;   (setq flymake-err-line-patterns
;;         (append flymake-err-line-patterns
;;                 flymake-python-err-line-patterns))
;;   (flymake-mode t))
;; (add-hook 'python-mode-hook '(lambda () (flymake-python-load)))
