;; (require 'projectile)
(projectile-global-mode)
(define-key projectile-mode-map (kbd "M-p g") 'projectile-ag)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)

;; (require 'helm-projectile)
(global-set-key (kbd "C-'") 'helm-projectile)

;; reorder sources
(setq helm-projectile-sources-list
      '(helm-source-projectile-buffers-list
        helm-source-projectile-files-list
        ;; helm-source-projectile-recentf-list
        ))
