(require 'smart-compile)
(global-set-key "\C-cc" 'smart-compile)
(setq smart-compile-alist
      (append '(("\\.pl\\'" . "perl -w %f")
		("\\.rb\\'" . "ruby -w %f"))
	      smart-compile-alist))
;;; TODO customize to fail back into executable-interpret