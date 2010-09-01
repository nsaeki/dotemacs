;; (auto-install-batch "auto-complete")
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
	       "~/.emacs.d/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

(global-set-key "\M-/" 'auto-complete)
(setq ac-use-menu-map t)
