(require 'slime)
(setq slime-net-coding-system 'utf-8-unix
      slime-protocol-version 'ignore)
(slime-setup '(slime-repl))
;(slime-setup '(slime-repl slime-fancy slime-banner))

(add-to-list 'auto-mode-alist '("\\.clj$" . lisp-mode))
