;; package: key-chord
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.04)
(key-chord-define-global "jk" 'view-mode)
(key-chord-define-global "df" 'org-remember)
(key-chord-define-global "vc" 'magit-status)
