(let ((my-packages '(ace-jump-mode
                     ag
                     all-ext
                     anzu
                     auto-complete
                     auto-highlight-symbol
                     auto-save-buffers-enhanced
                     bm
                     coffee-mode
                     color-moccur
                     dash-at-point
                     dockerfile-mode
                     expand-region
                     gist
                     git-gutter-fringe
                     helm
                     helm-ag
                     helm-bm
                     helm-c-yasnippet
                     helm-descbinds
                     helm-ghq
                     helm-gist
                     helm-ls-git
                     helm-migemo
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
                     quickrun
                     rainbow-mode
                     rbenv
                     recentf-ext
                     region-bindings-mode
                     rspec-mode
                     rubocop
                     sass-mode
                     sequential-command
                     shell-command
                     smart-compile
                     smartparens
                     smartrep
                     sml-modeline
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
