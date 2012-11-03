((abbrev-complete status "installed" recipe
                  (:name abbrev-complete :auto-generated t :type emacswiki :description "Abbrev mode completion function" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/abbrev-complete.el"))
 (ack status "removed" recipe nil)
 (auto-complete status "removed" recipe nil)
 (auto-complete+ status "removed" recipe nil)
 (auto-complete-emacs-lisp status "removed" recipe nil)
 (auto-complete-extension status "removed" recipe nil)
 (autopair status "removed" recipe nil)
 (browse-kill-ring status "required" recipe
                   (:name browse-kill-ring :description "Interactively insert items from kill-ring" :type emacswiki :features browse-kill-ring))
 (coffee-mode status "removed" recipe nil)
 (color-moccur status "removed" recipe nil)
 (color-theme status "removed" recipe nil)
 (color-theme-railscasts status "installed" recipe
                         (:name color-theme-railscasts :description "Railscasts color theme for Emacs." :type github :pkgname "olegshaldybin/color-theme-railscasts" :depends color-theme :prepare
                                (autoload 'color-theme-railscasts "color-theme-railscasts" "color-theme: railscasts" t)))
 (column-marker status "required" recipe
                (:name column-marker :description "Highlight certain character columns" :type emacswiki :features column-marker))
 (csharp-mode status "removed" recipe nil)
 (css-mode status "removed" recipe nil)
 (csv-mode status "removed" recipe nil)
 (dsvn status "required" recipe
       (:name dsvn :description "This is an interface for managing Subversion working copies.  It can show you an up-to-date view of the current status, and commit changes. If also helps you do other tasks such as updating, switching, diffing and more." :type http :url "http://svn.apache.org/repos/asf/subversion/trunk/contrib/client-side/emacs/dsvn.el"))
 (egg status "removed" recipe nil)
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :features el-get :info "." :load "el-get.el"))
 (fuzzy status "removed" recipe nil)
 (gh status "removed" recipe nil)
 (ghc-mod status "removed" recipe nil)
 (gist status "removed" recipe nil)
 (grep-a-lot status "removed" recipe nil)
 (grep-edit status "required" recipe
            (:name grep-edit :auto-generated t :type emacswiki :description "edit grep buffer and apply the changes to files" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/grep-edit.el"))
 (haml-mode status "removed" recipe nil)
 (helm status "removed" recipe nil)
 (igrep status "removed" recipe nil)
 (inf-ruby status "removed" recipe nil)
 (ipa status "installed" recipe
      (:name ipa :description "In-place annotations" :type emacswiki :features "ipa"))
 (jaspace status "installed" recipe
          (:name jaspace :type http :description "Make Japanese whitespaces visible" :url "http://homepage3.nifty.com/satomii/software/jaspace.el" :features jaspace :post-init
                 (progn
                   (global-font-lock-mode t)
                   (setq jaspace-alternate-jaspace-string "?")
                   (setq jaspace-alternate-eol-string "\n")
                   (setq jaspace-highlight-tabs 94))))
 (js2-mode status "removed" recipe nil)
 (json status "removed" recipe nil)
 (key-chord status "removed" recipe nil)
 (logito status "removed" recipe nil)
 (mark-multiple status "removed" recipe nil)
 (markdown-mode status "removed" recipe nil)
 (mcomplete status "installed" recipe
            (:name mcomplete :type http :url "http://homepage1.nifty.com/bmonkey/emacs/elisp/mcomplete.el"))
 (moccur-edit status "installed" recipe
              (:name moccur-edit :auto-generated t :type emacswiki :description "apply replaces to multiple files" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/moccur-edit.el"))
 (package status "installed" recipe
          (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin 24 :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
                 (progn
                   (setq package-user-dir
                         (expand-file-name
                          (convert-standard-filename
                           (concat
                            (file-name-as-directory default-directory)
                            "elpa")))
                         package-directory-list
                         (list
                          (file-name-as-directory package-user-dir)
                          "/usr/share/emacs/site-lisp/elpa/"))
                   (make-directory package-user-dir t)
                   (unless
                       (boundp 'package-subdirectory-regexp)
                     (defconst package-subdirectory-regexp "^\\([^.].*\\)-\\([0-9]+\\(?:[.][0-9]+\\)*\\)$" "Regular expression matching the name of\n a package subdirectory. The first subexpression is the package\n name. The second subexpression is the version string."))
                   (setq package-archives
                         '(("ELPA" . "http://tromey.com/elpa/")
                           ("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (pcache status "removed" recipe nil)
 (php-mode status "required" recipe
           (:name php-mode :description "A PHP mode for GNU Emacs " :type github :pkgname ejmr/php-mode :website "https://github.com/ejmr/php-mode"))
 (point-undo status "installed" recipe
             (:name point-undo :auto-generated t :type emacswiki :description "undo/redo position" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/point-undo.el"))
 (popup status "removed" recipe nil)
 (popwin status "removed" recipe nil)
 (powerline status "removed" recipe nil)
 (pymacs status "removed" recipe nil)
 (python status "removed" recipe nil)
 (python-mode status "removed" recipe nil)
 (quickrun status "removed" recipe nil)
 (regex-tool status "removed" recipe nil)
 (ri-emacs status "removed" recipe nil)
 (rinari status "removed" recipe nil)
 (rspec-mode status "removed" recipe nil)
 (ruby-block status "removed" recipe nil)
 (ruby-compilation status "removed" recipe nil)
 (ruby-electric status "removed" recipe nil)
 (ruby-mode status "removed" recipe nil)
 (sass-mode status "removed" recipe nil)
 (sequential-command status "installed" recipe
                     (:name sequential-command :auto-generated t :type emacswiki :description "Many commands into one command" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/sequential-command.el"))
 (sequential-command-config status "installed" recipe
                            (:name sequential-command-config :auto-generated t :type emacswiki :description "Examples of sequential-command.el " :website "https://raw.github.com/emacsmirror/emacswiki.org/master/sequential-command-config.el"))
 (smart-compile status "installed" recipe
                (:name smart-compile :auto-generated t :type emacswiki :description "an interface to `compile'" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/smart-compile.el"))
 (summarye status "installed" recipe
           (:name summarye :auto-generated t :type emacswiki :description "list up matched strings from a buffer, and display them in summary buffer" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/summarye.el"))
 (viewer status "installed" recipe
         (:name viewer :auto-generated t :type emacswiki :description "View-mode extension" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/viewer.el"))
 (wdired status "required" recipe
         (:name wdired :auto-generated t :type emacswiki :description "" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/wdired.el"))
 (wgrep status "required" recipe
        (:name wgrep :auto-generated t :type emacswiki :description "Writable grep buffer and apply the changes to files" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/wgrep.el"))
 (yaml-mode status "removed" recipe nil)
 (yasnippet status "removed" recipe nil)
 (yasnippet-config status "removed" recipe nil)
 (zencoding-mode status "removed" recipe nil))
