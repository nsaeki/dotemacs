(require 'magit)
(require 'key-chord)
;; (key-chord-define-global "vc" 'magit-status) ;; moved to 40key-chord.el

(require 'helm-ls-git)
(when (require 'helm-files)
  (add-to-list 'helm-for-files-preferred-list helm-c-source-ls-git-status t)
  (add-to-list 'helm-for-files-preferred-list helm-c-source-ls-git t))
