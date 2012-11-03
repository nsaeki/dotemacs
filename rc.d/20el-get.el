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
        (:name helm
               :type git
               :url "https://github.com/emacs-helm/helm.git")
        (:name yasnippet
               :type git
               :url "https://github.com/capitaomorte/yasnippet.git")
        ;; for gist.el
        (:name gh
               :type git
               :url "https://github.com/sigma/gh.el.git")
        (:name pcache
               :type git
               :url "https://github.com/sigma/pcache.git")
        (:name logito
               :type git
               :url "https://github.com/sigma/logito.git")
        ))

(el-get 'sync)
;(el-get 'wait)
