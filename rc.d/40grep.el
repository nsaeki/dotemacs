;; (install-elisp-from-emacswiki "igrep.el")
(require 'igrep)
(igrep-define lgrep (igrep-use-zgrep nil)(igrep-regex-option "-n -Ou8"))
(igrep-find-define lgrep (igrep-use-zgrep nil)(igrep-regex-option "-n -Ou8"))

;; (install-elisp-from-emacswiki "grep-a-lot.el")
(require 'grep-a-lot)
(grep-a-lot-setup-keys)
(grep-a-lot-advise igrep)

;; (el-get-install "grep-edit")
(require 'grep-edit)
