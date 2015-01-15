;; (install-packege: 'projectile 'helm-projectile)
(setq projectile-keymap-prefix (kbd "M-p"))
(projectile-global-mode)
;; temporary off, helm-projectile.el is empty file.
;;(helm-projectile-on)

(defun projectile-helm-ag ()
  (interactive)
  (helm-ag (when (projectile-project-p)
             (projectile-project-root))))
