(ensure-package-installed 'magit)
(require 'magit)
;; (key-chord-define-global "vc" 'magit-status) ;; moved to 40key-chord.el

(ensure-package-installed 'helm-git 'helm-git-grep 'helm-git-files 'helm-ls-git)
(require 'helm-git-files)
(global-set-key (kbd "C-:") 'helm-git-files)

(require 'helm-ls-git)
(when (require 'helm-files)
  (add-to-list 'helm-for-files-preferred-list helm-c-source-ls-git-status t)
  (add-to-list 'helm-for-files-preferred-list helm-c-source-ls-git t))
