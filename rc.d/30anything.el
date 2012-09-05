;; (auto-install-batch "anything")
;;(require 'anything-startup)

(require 'anything-config)
(require 'anything-match-plugin)
(require 'anything-show-completion)
(require 'anything-auto-install nil t)
(require 'anything-grep nil t)

;;(anything-iswitchb-setup)

;; (setq anything-for-files-prefered-list
;;       '(anything-c-source-ffap-line
;; 	anything-c-source-ffap-guesser
;; 	anything-c-source-buffers+
;; 	anything-c-source-recentf
;; 	anything-c-source-bookmarks
;; 	anything-c-source-file-cache
;; 	anything-c-source-files-in-current-dir+
;; 	;; for linux
;; 	;anything-c-source-locate
;; 	;; for mac
;; 	anything-c-source-mac-spotlight
;; 	)
;; )

(global-set-key (kbd "C-;") 'anything-for-files)
(global-set-key (kbd "C-'") 'anything-M-x)
(global-set-key (kbd "C-.") 'anything-imenu)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)

;; anything plugins
;(require 'anything-dabbrev-expand)

;; (install-elisp-from-emacswiki "anything-etags.el")
(require 'anything-etags)
(define-key global-map (kbd "M-.") 'anything-etags-select-from-here)

;; (install-elisp-from-emacswiki "descbinds-anything.el")
(require 'descbinds-anything)
(descbinds-anything-install)

;; (install-elisp "http://svn.coderepos.org/share/lang/elisp/anything-c-moccur/trunk/anything-c-moccur.el")
(require 'anything-c-moccur)
(setq moccur-split-word t)
(global-set-key (kbd "M-s") 'anything-c-moccur-occur-by-moccur)
(define-key isearch-mode-map (kbd "C-o") 'anything-c-moccur-from-isearch)

;; (install-elisp-from-emacswiki "anything-migemo.el")
(require 'anything-migemo)
;;(setq anything-use-migemo t)