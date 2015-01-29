;; projectile
(setq projectile-keymap-prefix (kbd "M-s-p")) ; not using this
(projectile-global-mode)

(defun projectile-helm-ag ()
  (interactive)
  (helm-ag (when (projectile-project-p)
             (projectile-project-root))))
