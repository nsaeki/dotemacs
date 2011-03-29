;; (require 'actionscript-mode)
;;(autoload 'actionscript-mode "actionscript-mode" "Major mode for actionscript." t)
(autoload 'actionscript-mode "actionscript-mode-haas-7.0" "Major mode for actionscript." t)

(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))

;; mxml
(setq auto-mode-alist
      (append
       (list
        '("\\.mxml" . xml-mode))
       auto-mode-alist))
(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)
