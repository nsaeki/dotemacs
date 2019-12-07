(let ((my-packages '(ag
                     ;; auto-complete
                     ;; direx
                     ;; lsp
                     ;; neotree
                     ;; alchemist
                     all-ext
                     anzu
                     auto-highlight-symbol
                     auto-save-buffers-enhanced
                     avy
                     bm
                     coffee-mode
                     color-moccur
                     company
                     company-lsp
                     dash-at-point
                     diff-hl
                     dockerfile-mode
                     ;; elixir-mode
                     evil
                     exec-path-from-shell
                     expand-region
                     flycheck
                     gist
                     git-gutter-fringe
                     go-autocomplete
                     go-direx
                     go-eldoc
                     go-errcheck
                     go-mode
                     golint
                     gotest
;                     header2
                     helm
                     helm-ag
                     helm-bm
                     helm-c-yasnippet
                     helm-descbinds
                     helm-ghq
                     helm-ls-git
                     helm-migemo
                     helm-projectile
                     highlight-symbol
                     inf-ruby
                     init-loader
                     json-mode
                     key-chord
                     less-css-mode
                     lsp-mode
                     lsp-ui
                     magit
                     markdown-mode
                     migemo
                     minitest
                     multiple-cursors
                     open-junk-file
                     org
                     org-journal
                     ox-gfm
                     php-mode
                     popwin
                     powershell
                     projectile
                     quickrun
                     rainbow-mode
                     rbenv
                     recentf-ext
                     region-bindings-mode
                     rjsx-mode
                     rspec-mode
                     rubocop
                     ruby-test-mode
                     rust-mode
                     sass-mode
                     search-web
                     sequential-command
                     shell-command
                     shell-pop
                     slim-mode
                     smart-compile
                     smartparens
                     smartrep
                     sml-modeline
                     sql-indent
                     toml-mode
                     undo-tree
                     viewer
                     volatile-highlights
                     web-mode
                     wgrep-ag
                     whitespace-cleanup-mode
                     yaml-mode
                     yard-mode
                     yasnippet
                     zencoding-mode
                     zop-to-char)))
  (dolist (x my-packages)
    (when (not (package-installed-p x))
      (package-install x))))
