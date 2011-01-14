(load-library "nxhtml/autostart")
(custom-set-variables
 '(ecb-options-version "2.32")
 '(indent-region-mode t)
 '(nxhtml-global-minor-mode t)
 '(nxhtml-global-validation-header-mode t)
 '(nxhtml-skip-welcome t))
(custom-set-faces
 '(mumamo-background-chunk-major ((((class color) (min-colors 8)) (:background "*"))))
 '(mumamo-background-chunk-submode ((((class color) (min-colors 8)) (:background "*")))))
(add-hook 'nxml-mode-hook
          (lambda ()
            (setq auto-fill-mode -1)
            (setq nxml-slash-auto-complete-flag t)
            (setq nxml-child-indent 2)
            (setq indent-tabs-mode t)
            (setq tab-width 2)))
