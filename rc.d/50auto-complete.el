;; (auto-install-batch "auto-complete")
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
	       "~/.emacs.d/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;; (require 'auto-complete)
;; (global-auto-complete-mode t)
;; (setq ac-auto-start nil)
;; (global-set-key "\M-/" 'ac-start)
;; (define-key ac-complete-mode-map "\C-n" 'ac-next)
;; (define-key ac-complete-mode-map "\C-p" 'ac-previous)
