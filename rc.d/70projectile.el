;; (install-packege: 'projectile 'helm-projectile)
(projectile-global-mode)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
(setq projectile-completion-system 'helm)
;; (helm-projectile-toggle 1)
