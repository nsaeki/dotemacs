(ensure-package-installed 'helm)
(require 'helm-config)
(require 'helm-match-plugin)
;; (require 'heml-show-completion)
(require 'helm-grep nil t)

(setq helm-for-files-preferred-list
  '(helm-source-buffers-list
    helm-source-recentf
    helm-source-bookmarks
    ;; helm-source-file-cache
    helm-source-files-in-current-dir))

(global-set-key (kbd "C-;") 'helm-for-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-.") 'helm-imenu)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; (require 'helm-etags)
;; (define-key global-map (kbd "M-.") 'helm-etags-select-from-here)

(ensure-package-installed 'helm-descbinds)
(require 'helm-descbinds)
(helm-descbinds-install)

(ensure-package-installed 'helm-c-moccur)
(require 'helm-c-moccur)
(setq moccur-split-word t)
(global-set-key (kbd "M-o") 'helm-c-moccur-occur-by-moccur)
(global-set-key (kbd "C-M-o") 'helm-c-moccur-dmoccur)
(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key (kbd "O") 'helm-c-moccur-dired-do-moccur-by-moccur)))
(define-key isearch-mode-map (kbd "M-o") 'helm-c-moccur-from-isearch)

(ensure-package-installed 'helm-migemo)
(require 'helm-migemo)
;;(setq helm-use-migemo t)

(ensure-package-installed 'helm-ghq)
(require 'helm-ghq)
(setq helm-for-files-preferred-list
      (append helm-for-files-preferred-list '(helm-source-ghq)))
(global-set-key (kbd "C-:") 'helm-ghq)
