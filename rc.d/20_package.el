;; Marmalade
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; MELPA
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Org-mode
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

(when (not package-archive-contents)
  (package-refresh-contents))

;; (require 'cask)
;; (cask-initialize)
