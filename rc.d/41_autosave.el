;; package: auto-save-buffers-enhanced
;; (auto-save-buffers-enhanced-include-only-checkout-path t)
(setq auto-save-buffers-enhanced-exclude-regexps '("^/scp:"
                                                   "^/scpc:"
                                                   "^/ssh:"
                                                   "/sudo:"
                                                   "/multi:"))
(auto-save-buffers-enhanced t)
(setq auto-save-buffers-enhanced-interval 1)
