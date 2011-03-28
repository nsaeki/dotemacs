(add-to-load-path-recompile "~/.emacs.d/elisp/scala-mode/")
(require 'scala-mode-auto)

(add-to-list 'load-path "~/.emacs.d/elisp/ensime_2.8.1-0.4.4/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)