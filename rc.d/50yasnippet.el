;; (install-elisp-from-emacswiki "yasnippet-config.el")

;; yas/setup adds yasnippet directory to load-path,
;; but requires yasnippet.el before do so, and fails to initialze.
;; this line is probably workaround.
(add-to-load-path-recompile "~/.emacs.d/plugins/yasnippet/")

(require 'yasnippet-config)
(yas/setup "~/.emacs.d/plugins/yasnippet/")

;; rails snippets
;; (load "~/.emacs.d/plugins/yasnippets-rails/setup")
;; (yas/load-directory "~/.emacs.d/plugins/yasnippets-rails/rails-snippets")
