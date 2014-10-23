(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; emacswiki reicipes' initialization is too slow.
(setq el-get-install-skip-emacswiki-recipes t)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; (add-to-list 'el-get-recipe-path "~/emacs.d/el-get/recipes")

(setq el-get-sources
      '(
        (:name mcomplete
               :type http
               :url "http://homepage1.nifty.com/bmonkey/emacs/elisp/mcomplete.el")
        (:name mcomplete-history
               :type http
               :url "http://www.bookshelf.jp/elc/mcomplete-history.el")
        ))

;; my packages
(setq my/el-get-packages
      (append
       '(mcomplete
         mcomplete-history
         )))

(el-get 'sync my/el-get-packages)
