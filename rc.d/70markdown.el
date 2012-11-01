(require 'markdown-mode)
(setq auto-mode-alist
      (append '(("\\.mkdn$" . markdown-mode)
                ("\\.markdown$" . markdown-mode)
                ("\\.md$" . markdown-mode))
              auto-mode-alist))
