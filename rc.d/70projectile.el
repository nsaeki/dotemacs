(ensure-package-installed 'projectile 'helm-projectile)
(require 'projectile)
(projectile-global-mode)
(define-key projectile-mode-map (kbd "M-p g") 'projectile-ag)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)

(require 'helm-projectile)
;; (global-set-key (kbd "C-c h") 'helm-projectile)
(global-set-key (kbd "C-'") 'helm-projectile)
