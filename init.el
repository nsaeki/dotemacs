(setq ring-bell-function '(lambda ()))
(tool-bar-mode 0)
(setq scroll-preserve-screen-position t)
(set-scroll-bar-mode 'right)
(scroll-bar-mode 0)
(setq scroll-step 1)
(setq inhibit-startup-message t)
;(setq-default transient-mark-mode t)
(windmove-default-keybindings)
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)
(blink-cursor-mode 0)
(column-number-mode t)
(line-number-mode t)
;(setq-default tab-width 4 indent-tabs-mode nil)
(savehist-mode 1)
(ffap-bindings)
(defalias 'yes-or-no-p 'y-or-n-p)

;; keyboard shortcuts
;(global-set-key "\C-cc" 'compile)
(global-unset-key "\C-z")
(global-set-key (kbd "C-c r") 'query-replace)

;; editing in dired-mode
(require 'dired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; hi-line
;(setq hl-line-face 'underline)
;(global-hl-line-mode 1)

;; font-lock-mode
(global-font-lock-mode t)

;; show-paren-mode
(show-paren-mode 1)
(setq show-paren-style 'mixed)
;(set-face-background 'show-paren-match-face "gray10")
;(set-face-foreground 'show-paren-match-face "SkyBlue")

;; dabberv
;(setq *dabbervs-case-fold* t)
(setq dabberv-case-fold-search nil)
;(setq dabbrev-case-replace nil)

;; auto-mode-alist
(setq auto-mode-alist
      (append '(
                ("\\.xhtml$" . sgml-mode)
                ("\\.xsl$" . xml-mode)
                ("\\.xsd$" . xml-mode)
                ("\\.rng$" . xml-mode)
                ("\\.el$" . emacs-lisp-mode))
	      auto-mode-alist))

;; creates emacs backup and autosave files in backup directory
(defvar user-temporary-file-directory "~/.emacs.d/backup/")
(make-directory user-temporary-file-directory t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; remembers cursor position
(setq save-place-file "~/.emacs.d/save-places")
(setq-default save-place t)
(require 'saveplace)

;; change buffer names like <2> to <dir> 
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; save bookmark
(setq bookmark-default-file "~/.emacs.d/bookmark")
(setq bookmark-save-flag 1)
(progn
  (setq bookmark-sort-flag nil)
  (defun bookmark-arrange-latest-top ()
    (let ((latest (bookmark-get-bookmark bookmark)))
      (setq bookmark-alist (cons latest (delq latest bookmark-alist))))
    (bookmark-save))
  (add-hook 'bookmark-after-jump-hook 'bookmark-arrange-latest-top))

(defun add-to-load-path-recompile (dir)
  (add-to-list 'load-path dir)
  (let (save-abbrevs) (byte-recompile-directory dir)))
(add-to-load-path-recompile "~/.emacs.d/elisp/")
(add-to-load-path-recompile "~/.emacs.d/auto-install/")

;; init scripts
(setq rc-directory "~/.emacs.d/rc.d/")
(add-to-list 'load-path rc-directory)
(dolist (file (directory-files rc-directory t "^[0-9]+\.*\\.el$"))
  (load file))
