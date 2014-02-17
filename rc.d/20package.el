(require 'package)
(package-initialize)

;; Marmalade
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; MELPA
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))

;; Org-mode
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
