;; reference
;; http://d.hatena.ne.jp/samurai20000/20100907/1283791433
;; http://d.hatena.ne.jp/ground256/20111008/1318063872
(require 'migemo)

;; for C/Migemo
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)

;; for Mac OS X Homebrewed cmigemo
(when (file-executable-p "/usr/local/bin/cmigemo")
  (setq migemo-command "/usr/local/bin/cmigemo"))
(when (file-exists-p "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict"))

(migemo-init)
(set-process-query-on-exit-flag (get-process "migemo") nil)

;; default off
;(setq migemo-isearch-enable-p nil)

;; emacs cache
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)

;; rewrite migemo isearch key-map
(add-hook 'isearch-mode-hook
          (lambda ()
            (define-key isearch-mode-map "\C-y" 'isearch-yank-kill)
            (define-key isearch-mode-map "\M-y" 'migemo-isearch-yank-line))
          t)                            ; third arg means add last hook.
