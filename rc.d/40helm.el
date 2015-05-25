(require 'helm-config)
(require 'helm-match-plugin)
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

(require 'helm-migemo)
;; Workaround for helm-migemo
;; http://rubikitch.com/2014/12/19/helm-migemo/
(eval-after-load "helm-migemo"
  '(defun helm-compile-source--candidates-in-buffer (source)
     (helm-aif (assoc 'candidates-in-buffer source)
         (append source
                 `((candidates
                    . ,(or (cdr it)
                           (lambda ()
                             ;; Do not use `source' because other plugins
                             ;; (such as helm-migemo) may change it
                             (helm-candidates-in-buffer (helm-get-current-source)))))
                   (volatile) (match identity)))
       source)))

(require 'helm-bm)
(push '(migemo) helm-source-bm)

(require 'helm-imenu)
(push '(migemo) helm-source-imenu)

(define-key isearch-mode-map (kbd "M-o") 'helm-occur-from-isearch)
(helm-descbinds-install)
