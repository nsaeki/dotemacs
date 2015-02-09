(setq ring-bell-function '(lambda ()))
(setq inhibit-startup-message t)
(setq completion-ignore-case t)
(setq set-mark-command-repeat-pop t)
(setq mouse-drag-copy-region t)
(setq scroll-preserve-screen-position t)
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)

(ffap-bindings)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(savehist-mode 1)
(setq linum-format "%4d ")
(global-linum-mode t)
(column-number-mode t)
(global-font-lock-mode t)
(global-hl-line-mode t)
;; (electric-pair-mode t)                  ; use smartparens
(global-auto-revert-mode 1)
(which-function-mode t)
;; (global-subword-mode 1)                 ; for CamelCase
(setq-default indent-tabs-mode nil)
(setq-default line-spacing 0.2)         ; a little wider
(defalias 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)

;; Shift + Arrow Key moves window focus
(windmove-default-keybindings)

(setq-default mode-line-format
              '("%e" mode-line-front-space
                mode-line-mule-info
                mode-line-client
                mode-line-modified
                mode-line-remote
                mode-line-frame-identification
                mode-line-buffer-identification
                "   "
                mode-line-position
                smartrep-mode-line-string
                (vc-mode vc-mode)
                "  "
                ;; Make visible which-function-mode info
                mode-line-misc-info
                mode-line-modes
                mode-line-end-spaces))

;; Scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed nil) ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ; scroll window under mouse
(setq scroll-step 1) ; keyboard scroll one line at a time

;; dabberv
;(setq *dabbervs-case-fold* t)
(setq dabberv-case-fold-search nil)
;(setq dabbrev-case-replace nil)

;; Remembers cursor position
(setq save-place-file "~/.emacs.d/save-places")
(setq-default save-place t)
(require 'saveplace)

;; Editing in dired-mode
(require 'dired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

(require 'server)
(unless (server-running-p)
  (server-start))

;; auto-mode-alist for misc file types.
(setq auto-mode-alist
      (append '(("Cask$" . lisp-mode)
                ("\\.xsd$" . xml-mode)
                ("\\.rng$" . xml-mode))
              auto-mode-alist))

;; Creates backup and autosave files in backup directory
(defvar user-temporary-file-directory "~/.emacs.d/backup")
(make-directory user-temporary-file-directory t)
(setq make-backup-files nil)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)))
(setq auto-save-default nil)
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))
