(add-hook 'php-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-.") 'helm-imenu)
             (local-set-key (kbd "C-c C-.") 'php-show-arglist)))

;; php-imenu
(autoload 'php-imenu-create-index "php-imenu" nil t)
;; Add the index creation function to the php-mode-hook
;; In php-mode 1.2, it's php-mode-user-hook.  In 1.4, it's php-mode-hook.
(add-hook 'php-mode-hook 'php-imenu-setup)
(defun php-imenu-setup ()
  (setq imenu-create-index-function (function php-imenu-create-index))
  ;; uncomment if you prefer speedbar:
  ;(setq php-imenu-alist-postprocessor (function reverse))
  (imenu-add-menubar-index))
