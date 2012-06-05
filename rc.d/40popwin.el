(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; for anything
(setq anything-samewindow nil)
;(push '("*anything.*" :height 20) popwin:special-display-config)
(push '("^\*anything.*" :regexp 1 :height 20) popwin:special-display-config)
;;(push '("*anything for files*" :height 20) popwin:special-display-config)