(require 'package)
(package-initialize)

;; Marmalade
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; MELPA
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))

;; Org-mode
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my/elpa-packages
  '(ac-dabbrev
    ;; ack-and-a-half
    ag
    auto-complete
    ;; auto-complete-clang
    autopair
    bm
    browse-kill-ring
    coffee-mode
    color-moccur
    color-theme
    ;; cperl-mode
    ;; csharp-mode
    csv-mode
    ;; cygwin-mount
    ;; dsvn
    egg
    flymake-coffee
    flymake-css
    flymake-cursor
    flymake-haml
    flymake-jslint
    flymake-python-pyflakes
    flymake-ruby
    flymake-sass
    flymake-shell
    flymake-easy
    ;; full-ack
    fuzzy-match
    grep-a-lot
    gtags
    gist
    ;; haskell-mode
    helm-c-moccur
    helm-c-yasnippet
    helm-descbinds
    helm-gist
    helm-git
    helm-git-files
    helm-git-grep
    helm-gtags
    helm-ls-git
    helm-migemo
    helm-bm
    helm
    ;; igrep
    key-chord
    less-css-mode
    magit
    markdown-mode
    migemo
    open-junk-file
    org
    ;; php-mode
    point-undo
    ;; popup
    popwin
    pymacs
    python
    python-mode
    quickrun
    recentf-ext
    ;; regex-tool
    rinari
    ;; jump
    ;; inflections
    ;; findr
    rspec-mode
    ruby-block
    ruby-compilation
    ;; inf-ruby
    ;; ruby-electric
    ruby-end
    ruby-test-mode
    ruby-tools
    ruby-dev
    rbenv
    sass-mode
    haml-mode
    ruby-mode
    sequential-command
    shell-command
    smart-compile
    sml-modeline
    summarye
    undo-tree
    wgrep-ag
    ;; wgrep-ack
    ;; wgrep
    yaml-mode
    yari
    yasnippet
    ;; yasnippet-bundle
    zencoding-mode))

(dolist (package my/elpa-packages)
  (unless (package-installed-p package)
    (package-install package)))
