;; (require 'actionscript-mode)
;;(autoload 'actionscript-mode "actionscript-mode" "Major mode for actionscript." t)
(autoload 'actionscript-mode "actionscript-mode-haas-7.0" "Major mode for actionscript." t)

(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))

;; MuMaMo
;; http://transfinite.wordpress.com/2009/04/24/multiple-modes-for-mxml-and-actionscript-in-emacs/
(defun mumamo-chunk-mxml-script (pos min max)
  "Find ... , return range and actionscript-mode."
  (mumamo-quick-static-chunk pos min max "<![CDATA[" "]]>" nil 'actionscript-mode nil))

(define-mumamo-multi-major-mode mxml-actionscript-mumamo-mode
  "Turn on multiple major modes for MXML files with main mode `nxml-mode'.
This covers inlined Actionscript."
  ("MXML Actionscript Family" nxml-mode
   (mumamo-chunk-mxml-script
    )))

(add-to-list 'auto-mode-alist '("\\.mxml$" . mxml-actionscript-mumamo))
