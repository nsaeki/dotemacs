(let ((my-packages '(shell-command
                     open-junk-file
                     sequential-command
                     recentf-ext
                     color-moccur
                     point-undo
                     sml-modeline
                     ag
                     helm-ag
                     wgrep-ag
                     bm
                     helm-bm
                     helm
                     helm-descbinds
                     helm-migemo
                     helm-ghq
                     key-chord
                     migemo
                     popwin
                     smartparens
                     undo-tree
                     whitespace-cleanup-mode
                     auto-save-buffers-enhanced
                     anzu
                     auto-complete
                     expand-region
                     auto-highlight-symbol
                     highlight-symbol
                     multiple-cursors
                     smart-compile
                     coffee-mode
                     flymake-coffee
                     ;; csv-mode
                     dash-at-point
                     dockerfile-mode
                     magit
                     git-gutter
                     git-gutter-fringe
                     helm-git
                     helm-git-grep
                     helm-git-files
                     helm-ls-git
                     gist
                     helm-gist
                     ;; gtags
                     ;; helm-gtags
                     less-css-mode
                     markdown-mode
                     org
                     projectile
                     helm-projectile
                     rainbow-mode
                     rbenv
                     flymake-ruby
                     ruby-block
                     inf-ruby
                     rspec-mode
                     yard-mode
                     yasnippet
                     helm-c-yasnippet
                     yaml-mode
                     zencoding-mode
                     quickrun
                     region-bindings-mode
                     volatile-highlights
                     undohist
                     smartrep
                     web-mode
                     powershell)))
  (dolist (x my-packages)
    (when (not (package-installed-p x))
      (package-install x))))
