;; http://d.hatena.ne.jp/ground256/20111008/1318063872

(require 'migemo)

;; cmigemo
;;(setq migemo-command "cmigemo")
(setq migemo-command "/usr/local/bin/cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(setq migemo-regex-dictionary nil)
(migemo-init)

;; default off
;(setq migemo-isearch-enable-p nil)

;; emacs cache
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)

