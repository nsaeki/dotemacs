;; projectile
;; Avoid assigning "C-c p" prefix. Set useless prefix to me.
(setq projectile-keymap-prefix (kbd "M-s-p"))
(projectile-global-mode)

(defun my-projectile-helm-ag ()
  (interactive)
  (helm-ag (when (projectile-project-p)
             (projectile-project-root))))

(require 'helm-projectile)
(defun my-helm-for-project ()
  nil
  (interactive)
  (helm :sources  '(helm-source-projectile-buffers-list
                    helm-source-projectile-recentf-list
                    ;; Useful but slow to display
                    ;; helm-source-ls-git-status
                    ;; helm-source-ls-git
                    )
        :buffer "*helm for porject*"))
