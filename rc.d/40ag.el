(ensure-package-installed 'ag 'helm-ag 'wgrep-ag)

(require 'ag)
(require 'helm-ag)
(setq ag-highlight-search t)
;; (setq ag-reuse-window 'nil)
;; (setq ag-reuse-buffers 'nil)
(global-set-key (kbd "C-x g") 'helm-ag)

(require 'wgrep-ag)
(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)
(define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode)

;; ref. http://kotatu.org/blog/2013/12/18/emacs-ag-wgrep-for-code-grep-search/
;; focus ag buffer after searching
(defun my/filter (condp lst)
  (delq nil
        (mapcar (lambda (x) (and (funcall condp x) x)) lst)))
(defun my/get-buffer-window-list-regexp (regexp)
  "Return list of windows whose buffer name matches regexp."
  (my/filter #'(lambda (window)
              (string-match regexp
               (buffer-name (window-buffer window))))
          (window-list)))
(global-set-key [(super m)]
                #'(lambda ()
                    (interactive)
                    (call-interactively 'ag)
                    (select-window ; select ag buffer
                     (car (my/get-buffer-window-list-regexp "^\\*ag ")))))
