;; frame size
(setq initial-frame-alist
      (append (list
	       ;; '(width . 84)
	       ;; '(height . 42)
	       '(width . 168)
	       '(height . 46)
	       )
	      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)
(split-window-horizontally)

;; (install-elisp-from-emacswiki "open-junk-file.el")
(require 'open-junk-file)
(setq open-junk-file-format "~/work/sandbox/%Y-%m-%d-%H%M%S.")
