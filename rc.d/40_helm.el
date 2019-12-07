(require 'helm)
(require 'helm-config)
(require 'helm-occur)

(custom-set-variables
 '(helm-truncate-lines t)
 '(helm-buffer-max-length 35)
 '(helm-delete-minibuffer-contents-from-point t)
 '(helm-ff-skip-boring-files t)
 '(helm-ls-git-show-abs-or-relative 'relative)
 '(helm-ff-transformer-show-only-basename nil)
 '(helm-mini-default-sources '(helm-source-buffers-list
                               helm-source-recentf
                               helm-source-files-in-current-dir)))
                               ;; helm-source-ghq)))

(helm-migemo-mode t)

(require 'helm-bm)
(push '(migemo) helm-source-bm)

(require 'helm-imenu)
(push '(migemo) helm-source-imenu)

(define-key isearch-mode-map (kbd "M-o") 'helm-occur-from-isearch)
(helm-descbinds-install)

(require 'helm-ls-git)
;; (require 'helm-ghq)
