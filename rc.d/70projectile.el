;; projectile
(projectile-global-mode)
(defun my-projectile-helm-ag (arg)
  (interactive "p")
  (case arg
    (4 (helm-ag nil))
    (t (helm-ag (when (projectile-project-p)
                  (projectile-project-root))))))

(require 'helm-projectile)
(defun my-helm-for-project ()
  nil
  (interactive)
  (helm :sources '(helm-source-projectile-buffers-list
                   helm-source-projectile-recentf-list
                   ;; Useful but slow to display
                   ;; helm-source-ls-git-status
                   ;; helm-source-ls-git
                   helm-source-files-in-current-dir)
        :buffer "*helm for project*"))

(setq projectile-enable-caching t)
(helm-projectile-toggle 1)
