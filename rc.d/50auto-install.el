;; (install-elisp-from-emacswiki "auto-install.el")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-compatibility-setup)
;; disabled because 'auto-install-network-available-p' does not
;; work with http proxy.
;; (auto-install-update-emacswiki-package-name t)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
