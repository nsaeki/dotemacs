(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; for anything
(setq anything-samewindow nil)
(push '("^\*helm.*" :regexp 1 :height 25) popwin:special-display-config)
