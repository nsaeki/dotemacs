(require 'helm-config)
(require 'helm-match-plugin)
(require 'helm-swoop)
(require 'helm-ls-git)
(require 'helm-ghq)

(custom-set-variables
 '(helm-truncate-lines t)
 '(helm-buffer-max-length 35)
 '(helm-delete-minibuffer-contents-from-point t)
 '(helm-ff-skip-boring-files t)
 '(helm-ls-git-show-abs-or-relative 'relative)
 '(helm-ff-transformer-show-only-basename nil)
 '(helm-mini-default-sources '(helm-source-buffers-list
                               helm-source-recentf
                               helm-source-files-in-current-dir
                               helm-source-ghq)))

;; (define-key isearch-mode-map (kbd "M-o") 'helm-occur-from-isearch)
(helm-descbinds-install)

;; (require 'helm-migemo)
;;(setq helm-use-migemo t)
