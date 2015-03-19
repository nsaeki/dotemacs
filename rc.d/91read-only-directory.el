(require 'read-only-directory)
;; This cause package-install failure
;; (setq read-only-directory-default-directories
;;       (list (expand-file-name "~/.emacs.d/elpa")))
(read-only-directory-init)

(defun my-read-only-directory ()
  (interactive)
  (read-only-mode t)
  (read-only-directory (when (projectile-project-p)
                         (projectile-project-root))))
