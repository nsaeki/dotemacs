(add-to-list 'load-path "~/.emacs.d/elisp/scala-mode/")
(require 'scala-mode-auto)

(add-to-list 'load-path "~/.emacs.d/plugins/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)