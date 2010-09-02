(require 'smart-compile)
(global-set-key "\C-cc" 'smart-compile)
(setq smart-compile-alist
      (append '(("\\.pl\\'" . "perl -w %f")
		("\\.rb\\'" . "ruby -w %f")
		("\\.mxml\\'" . "mxmlc %f")
		("\\.as\\'" . "mxmlc %f"))
	      smart-compile-alist))
