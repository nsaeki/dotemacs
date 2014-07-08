(ensure-package-installed 'smart-compile)
(require 'smart-compile)
(global-set-key "\C-cc" 'smart-compile)

;; run scripts
(setq smart-compile-alist
      (append '(("\\.php\\'" . "php %f")
                ("\\.mxml\\'" . "mxmlc %f")
                ("\\.as\\'" . "mxmlc %f"))
              smart-compile-alist))

;; set to default (using shebang)
;; (delete '("\\.pl\\'" . "perl -cw %f") smart-compile-alist)
;; (delete '("\\.rb\\'" . "ruby -cw %f") smart-compile-alist)
