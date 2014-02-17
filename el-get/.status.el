((color-theme-idlefingers status "installed" recipe
                          (:name color-theme-idlefingers :type git :url "https://github.com/atog/idle-fingers-emacs.git"))
 (grep-edit status "installed" recipe
            (:name grep-edit :auto-generated t :type emacswiki :description "edit grep buffer and apply the changes to files" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/grep-edit.el"))
 (ipa status "installed" recipe
      (:name ipa :description "In-place annotations" :type emacswiki :features "ipa"))
 (jaspace status "installed" recipe
          (:name jaspace :type http :description "Make Japanese whitespaces visible" :url "http://homepage3.nifty.com/satomii/software/jaspace.el" :features jaspace :post-init
                 (progn
                   (global-font-lock-mode t)
                   (setq jaspace-alternate-jaspace-string "?")
                   (setq jaspace-alternate-eol-string "\n")
                   (setq jaspace-highlight-tabs 94))))
 (mcomplete status "installed" recipe
            (:name mcomplete :type http :url "http://homepage1.nifty.com/bmonkey/emacs/elisp/mcomplete.el"))
 (mcomplete-history status "installed" recipe
                    (:name mcomplete-history :type http :url "http://www.bookshelf.jp/elc/mcomplete-history.el"))
 (moccur-edit status "installed" recipe
              (:name moccur-edit :auto-generated t :type emacswiki :description "apply replaces to multiple files" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/moccur-edit.el"))
 (sequential-command-config status "installed" recipe
                            (:name sequential-command-config :auto-generated t :type emacswiki :description "Examples of sequential-command.el " :website "https://raw.github.com/emacsmirror/emacswiki.org/master/sequential-command-config.el"))
 (viewer status "installed" recipe
         (:name viewer :auto-generated t :type emacswiki :description "View-mode extension" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/viewer.el")))
