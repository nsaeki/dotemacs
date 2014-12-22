;; (install-packege: 'projectile 'helm-projectile)

(setq projectile-keymap-prefix (kbd "C-c C-p"))
(projectile-global-mode)

(define-key projectile-mode-map (kbd "M-p g") 'projectile-ag)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)

;; reorder sources
(setq helm-projectile-sources-list
      '(helm-source-projectile-buffers-list
        helm-source-projectile-files-list))
