(add-hook 'php-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-.") 'helm-imenu)
             (local-set-key (kbd "C-c C-.") 'php-show-arglist)))
