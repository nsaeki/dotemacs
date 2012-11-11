(require 'magit)
(require 'key-chord)
;; (key-chord-define-global "vc" 'magit-status)

(require 'egg)
(autoload 'egg-grep "egg-grep" nil t)
;; (setq egg-auto-update t)
;; (key-chord-define-global "vc" 'egg-status)

(require 'helm-ls-git)
(when (require 'helm-files)
  (add-to-list 'helm-for-files-preferred-list helm-c-source-ls-git-status t)
  (add-to-list 'helm-for-files-preferred-list helm-c-source-ls-git t)
  )
