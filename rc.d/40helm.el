(require 'helm-config)
(require 'helm-match-plugin)

(setq helm-for-files-preferred-list
  '(helm-source-buffers-list
    helm-source-recentf
    helm-source-files-in-current-dir))

(global-set-key (kbd "M-o") 'helm-occur)
(define-key isearch-mode-map (kbd "M-o") 'helm-occur-from-isearch)

(global-set-key (kbd "C-;") 'helm-for-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-.") 'helm-imenu)
(global-set-key (kbd "C-,") 'helm-bm)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; (require 'helm-etags)
;; (define-key global-map (kbd "M-.") 'helm-etags-select-from-here)

;; package: helm-descbinds
(helm-descbinds-install)

;; (require 'helm-migemo)
;;(setq helm-use-migemo t)

(require 'helm-ghq)
(setq helm-for-files-preferred-list
      (append helm-for-files-preferred-list '(helm-source-ghq)))
