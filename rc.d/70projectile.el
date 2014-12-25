;; (install-packege: 'projectile 'helm-projectile)
(projectile-global-mode)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
(helm-projectile-toggle 1)
