(require 'django-html-mode)
(require 'django-mode)
(yas/load-directory "~/.emacs.d/plugins/django-mode/snippets")
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))