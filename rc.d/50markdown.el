(require 'markdown-mode)
(setq auto-mode-alist
      (append '(("\\.mkdn$" . markdown-mode)
                ("\\.markdown$" . markdown-mode))
              auto-mode-alist))
