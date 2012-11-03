(setq ring-bell-function '(lambda ()))
(tool-bar-mode 0)
(scroll-bar-mode 0)
;(set-scroll-bar-mode 'right)
(setq inhibit-startup-message t)
(windmove-default-keybindings)
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)
(blink-cursor-mode 0)
(line-number-mode t)
(column-number-mode t)
(setq-default indent-tabs-mode nil)
(savehist-mode 1)
(ffap-bindings)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq read-file-name-completion-ignore-case t)
(setq mouse-drag-copy-region t)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq scroll-preserve-screen-position t)

;; keybindings
;(global-set-key "\C-cc" 'compile)
(global-set-key [M-return] 'indent-new-comment-line)
(global-unset-key "\C-z")
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "M-k") 'kill-this-buffer)
;(global-set-key (kbd "C-c r") 'query-replace)
;(define-key global-map (kbd "C-t") 'other-window)
;(keyboard-translate ?\C-h ?\C-?)
;(global-set-key (kbd "C-x ?") 'help-command)

;; editing in dired-mode
(require 'dired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; hi-line
;(setq hl-line-face 'underline)
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
                ("\\.cs$" . csharp-mode)
                ("\\.xhtml$" . sgml-mode)
                ("\\.xsl$" . xml-mode)
                ("\\.xsd$" . xml-mode)
                ("\\.rng$" . xml-mode)
                ("\\.el$" . emacs-lisp-mode))
	      auto-mode-alist))

;; creates emacs backup and autosave files in backup directory
(defvar user-temporary-file-directory "~/.emacs.d/backup")
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
;(add-to-load-path-recompile "~/.emacs.d/elisp/")

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat "~/.emacs.d/" path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp")

;; init scripts
(setq rc-directory "~/.emacs.d/rc.d/")
(add-to-list 'load-path rc-directory)
(dolist (file (directory-files rc-directory t "^[0-9]+\.*\\.el$"))
  (load file))
