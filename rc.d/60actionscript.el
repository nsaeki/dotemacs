(require 'cc-mode)
(require 'actionscript-mode)
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))

(defvar running-on-x (eq window-system 'x))
(eval-after-load "actionscript-mode" '(load "as-config"))
 
;; mxml
(setq auto-mode-alist
      (append
       (list
        '("\\.mxml" . xml-mode))
       auto-mode-alist))
(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)