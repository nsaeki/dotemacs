(require 'helm-config)
(require 'helm-match-plugin)
;; (require 'heml-show-completion)
(require 'helm-grep nil t)

(setq helm-for-files-preferred-list
      '(helm-c-source-ffap-line
        helm-c-source-ffap-guesser
        helm-c-source-buffers-list
        helm-c-source-recentf
        helm-c-source-bookmarks
        helm-c-source-file-cache
        helm-c-source-files-in-current-dir
        ))

;; (cond ((eq system-type 'darwin)
;;        (add-to-list 'helm-for-files-prefered-list
;;                     helm-c-source-mac-spotlight))
;;       ((eq system-type 'gnu/linux)
;;        (add-to-list 'helm-for-files-prefered-list
;;                     helm-c-source-locate)))

(global-set-key (kbd "C-;") 'helm-for-files)
(global-set-key (kbd "C-'") 'helm-M-x)
(global-set-key (kbd "C-.") 'helm-imenu)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; (require 'helm-etags)
;; (define-key global-map (kbd "M-.") 'helm-etags-select-from-here)

;; (install-elisp-from-emacswiki "descbinds-helm.el")
(require 'helm-descbinds)
(helm-descbinds-install)

(require 'helm-c-moccur)
(setq moccur-split-word t)
(global-set-key (kbd "M-o") 'helm-c-moccur-occur-by-moccur)
(global-set-key (kbd "C-M-o") 'helm-c-moccur-dmoccur)
(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key (kbd "O") 'helm-c-moccur-dired-do-moccur-by-moccur)))
(define-key isearch-mode-map (kbd "M-o") 'helm-c-moccur-from-isearch)

(require 'helm-migemo)
;;(setq helm-use-migemo t)
