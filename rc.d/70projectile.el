;; (install-packege: 'projectile 'helm-projectile)
(setq projectile-keymap-prefix (kbd "M-p"))
(projectile-global-mode)
(helm-projectile-on)

(defun projectile-helm-ag ()
  (interactive)
  (helm-ag (projectile-project-root)))
