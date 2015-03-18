(require 'read-only-directory)
(setq read-only-directory-default-directories
      (list (expand-file-name "~/.emacs.d/elpa")))
(read-only-directory-init)

(defun my-read-only-directory ()
  (interactive)
  (read-only-mode t)
  (read-only-directory (when (projectile-project-p)
                         (projectile-project-root))))
