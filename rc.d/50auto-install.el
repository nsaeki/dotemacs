;; (install-elisp-from-emacswiki "auto-install.el")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(add-to-list 'load-path auto-install-directory)
(auto-install-update-emacswiki-package-name t)
;(setq url-proxy-services '(("http" . "localhost:8339")))
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)