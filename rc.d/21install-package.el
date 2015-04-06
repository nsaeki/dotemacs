(let ((my-packages '(init-loader
                     ;; exec-path-from-shell
                     ace-jump-mode
                     ag
                     wgrep-ag
                     all-ext
                     anzu
                     auto-complete
                     auto-save-buffers-enhanced
                     bm
                     coffee-mode
                     color-moccur
                     dash-at-point
                     dockerfile-mode
                     expand-region
                     evil
                     go-mode
                     gotest
                     gist
                     git-gutter-fringe
                     diff-hl
                     header2
                     helm
                     helm-ag
                     helm-bm
                     helm-c-yasnippet
                     helm-descbinds
                     helm-ghq
                     helm-gist
                     helm-ls-git
                     helm-migemo
                     auto-highlight-symbol
                     highlight-symbol
                     inf-ruby
                     json-mode
                     key-chord
                     less-css-mode
                     magit
                     markdown-mode
                     migemo
                     multiple-cursors
                     open-junk-file
                     org
                     point-undo
                     popwin
                     powershell
                     projectile
                     helm-projectile
                     quickrun
                     rainbow-mode
                     search-web
                     rbenv
                     recentf-ext
                     region-bindings-mode
                     ruby-test-mode
                     rspec-mode
                     minitest
                     rubocop
                     sass-mode
                     sequential-command
                     shell-command
                     smart-compile
                     smartparens
                     smartrep
                     sml-modeline
                     sql-indent
                     undo-tree
                     viewer
                     volatile-highlights
                     web-mode
                     whitespace-cleanup-mode
                     yaml-mode
                     yard-mode
                     yasnippet
                     zencoding-mode)))
  (dolist (x my-packages)
    (when (not (package-installed-p x))
      (package-install x))))
