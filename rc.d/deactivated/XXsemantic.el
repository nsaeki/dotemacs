(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)

;;; semantic-imenu
(require 'semantic/imenu)
(setq semantic-imenu-summary-function
      (lambda (tag)
        (semantic-format-tag-summarize tag nil t)))