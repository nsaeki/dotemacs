(require 'helm-config)
(require 'helm-match-plugin)

(setq helm-for-files-preferred-list
  '(helm-source-buffers-list
    helm-source-recentf
    helm-source-files-in-current-dir))

(define-key isearch-mode-map (kbd "M-o") 'helm-occur-from-isearch)

;; package: helm-descbinds
(helm-descbinds-install)

;; (require 'helm-migemo)
;;(setq helm-use-migemo t)

(require 'helm-ghq)
(setq helm-for-files-preferred-list
      (append helm-for-files-preferred-list '(helm-source-ghq)))
