;; frame size
(setq initial-frame-alist
      (append (list
	       '(width . 84)
	       '(height . 42)
	       )
	      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)
(split-window-horizontally)
