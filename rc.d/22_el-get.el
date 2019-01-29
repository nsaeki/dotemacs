(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;; (el-get-bundle nsaeki/envcache.el)
(el-get-bundle nsaeki/read-only-directory.el)
(el-get-bundle nsaeki/idlefingers-emacs)
;; (el-get-bundle sugyan/helm-go-package :checkout "52d6ed2dca82d860d63ef654e85a9dd762c272f5")
(el-get-bundle antonj/scss-mode)
