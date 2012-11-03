(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))

(require 'el-get)

(setq el-get-sources
      '(
        (:name mcomplete
               :type http
               :url "http://homepage1.nifty.com/bmonkey/emacs/elisp/mcomplete.el")
        (:name mcomplete-history
               :type http
               :url "http://www.bookshelf.jp/elc/mcomplete-history.el")
        (:name color-theme-idlefingers
               :type git
               :url "https://github.com/atog/idle-fingers-emacs.git")
        ))

(el-get 'sync)
;(el-get 'wait)
