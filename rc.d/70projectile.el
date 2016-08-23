;; projectile
(projectile-global-mode)
(defun my-projectile-helm-ag (arg)
  (interactive "p")
  (case arg
    (4 (helm-ag nil))
    (t (helm-ag (when (projectile-project-p)
                  (projectile-project-root))))))

(require 'helm-projectile)

(defun my-helm-for-projects ()
  "Helm for projectile projects and ghq list"
  (interactive)
  (helm :sources '(helm-source-projectile-projects
                   helm-source-ghq)
        :buffer "*helm for project*"))

(defun my-helm-for-files-in-project ()
  "Helm for file and buffers in current project"
  (interactive)
  (helm :sources '(helm-source-projectile-buffers-list
                   helm-source-projectile-recentf-list
                   helm-source-projectile-files-list)
        :buffer "*helm for project*"))

(setq projectile-enable-caching t)
(helm-projectile-toggle 1)
