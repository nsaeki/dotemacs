;; (install-packege: 'projectile 'helm-projectile)
(setq projectile-keymap-prefix (kbd "M-p"))
(projectile-global-mode)
(helm-projectile-on)

(defun projectile-helm-ag ()
  (interactive)
  (helm-ag (when (projectile-project-p)
             (projectile-project-root))))
