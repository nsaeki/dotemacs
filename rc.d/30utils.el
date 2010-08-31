(require 'get-date)
;(require 'memo-mode)
;(require 'embed-memo)

(require 'shell-command)
(shell-command-completion-mode)

;; default in Emacs 23 or later
;(require 'physical-line)
;(setq-default physical-line-mode t)
;(setq physical-line-ignoring-mode-list '(dired-mode))

;; (require 'browse-kill-ring)
;; (browse-kill-ring-default-keybindings)
;; ;(global-set-key "\M-y" 'browse-kill-ring)
;; (define-key browse-kill-ring-mode-map (kbd "j") 'browse-kill-ring-forward)
;; (define-key browse-kill-ring-mode-map (kbd "k") 'browse-kill-ring-previous)
;; (define-key browse-kill-ring-mode-map (kbd "C-g") 'browse-kill-ring-quit)
;; ;(setq browse-kill-ring-display-style 'one-line)
;; ;(setq browse-kill-ring-resize-window nil)

;(require 'develock)
;(require 'jaspace)

;; (auto-install-batch "sequential-command")
(require 'sequential-command-config)
(sequential-command-setup-keys)

;; (install-elisp-from-emacswiki "recentf-ext.el")
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("/TAGS$" "/var/tmp"))
(require 'recentf-ext)

;; (install-elisp-from-emacswiki "tempbuf.el")
;(require 'tempbuf)
;(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

;; (install-elisp-from-emacswiki "color-moccur.el")
(require 'color-moccur)
(setq moccur-split-word t)

;; (install-elisp-from-emacswiki "moccur-edit.el")
(require 'moccur-edit)
(setq moccur-split-word t)

;; (install-elisp-from-emacswiki "column-marker.el")
;(require 'column-marker)

;; (install-elisp "http://taiyaki.org/elisp/mell/src/mell.el")
;; (install-elisp "http://taiyaki.org/elisp/text-adjust/src/text-adjust.el")
(require 'text-adjust)

;; (install-elisp-from-emacswiki "summarye.el")
;(require 'summarye)

;; (install-elisp-from-emacswiki "multiverse.el")
(require 'multiverse)

;; (install-elisp-from-emacswiki "point-undo.el")
(require 'point-undo)
(define-key global-map (kbd "C-z") 'point-undo)
(define-key global-map (kbd "C-M-z") 'point-redo)
