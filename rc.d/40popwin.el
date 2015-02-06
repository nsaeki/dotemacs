(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-height 20)

;; for helm
(push '("^\*helm.*" :regexp 1 :height 25) popwin:special-display-config)
