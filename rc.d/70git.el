(ensure-package-installed 'magit)
(require 'magit)
;; (key-chord-define-global "vc" 'magit-status) ;; moved to 40key-chord.el

(ensure-package-installed 'git-gutter)
(require 'git-gutter)
(git-gutter:linum-setup)
;; (ensure-package-installed 'git-gutter-fringe)
;; (require 'git-gutter-fringe)
;; (setq git-gutter-fr:side 'right-fringe)
(global-git-gutter-mode t)
(set-face-foreground 'git-gutter:modified "plum4")
(set-face-foreground 'git-gutter:added "seagreen4")
(set-face-foreground 'git-gutter:deleted "red4")
;; (custom-set-variables
;;  '(git-gutter:unchanged-sign " "))
;; (set-face-background 'git-gutter:unchanged "#333")
;; (set-face-background 'git-gutter:modified "#333")
;; (set-face-background 'git-gutter:added "#333")
;; (set-face-background 'git-gutter:deleted "#333")

;; (ensure-package-installed 'helm-git 'helm-git-grep 'helm-git-files 'helm-ls-git)
;; (require 'helm-git-files)
;; (global-set-key (kbd "C-:") 'helm-git-files)

;; disable this. suspiciously it crashes emacs.
;; (require 'helm-ls-git)
;; (when (require 'helm-files)
;;   (add-to-list 'helm-for-files-preferred-list helm-c-source-ls-git-status t)
;;   (add-to-list 'helm-for-files-preferred-list helm-c-source-ls-git t))
