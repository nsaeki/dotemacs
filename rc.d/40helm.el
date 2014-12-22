(require 'helm-config)
(require 'helm-match-plugin)

(setq helm-for-files-preferred-list
  '(helm-source-buffers-list
    helm-source-recentf
    helm-source-files-in-current-dir
    helm-source-file-cache))

;; (file-cache-add-directory-list '("~/.emacs.d/"))
;; (setq file-cache-filter-regexps
;;       (append file-cache-filter-regexps
;;               ;; 無視したいファイルの正規表現を指定もできる
;;               '("\\.cache$")))

(require 'helm-ls-git)
(custom-set-variables
 '(helm-truncate-lines t)
 '(helm-buffer-max-length 35)
 '(helm-delete-minibuffer-contents-from-point t)
 '(helm-ff-skip-boring-files t)
 '(helm-ls-git-show-abs-or-relative 'relative))

(setq helm-mini-default-sources '(helm-source-buffers-list
                                  helm-source-ls-git
                                  helm-source-recentf
                                  helm-source-buffer-not-found))

(define-key isearch-mode-map (kbd "M-o") 'helm-occur-from-isearch)

;; package: helm-descbinds
(helm-descbinds-install)

;; (require 'helm-migemo)
;;(setq helm-use-migemo t)

(require 'helm-ghq)
(setq helm-for-files-preferred-list
      (append helm-for-files-preferred-list '(helm-source-ghq)))
