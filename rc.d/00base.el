(setq ring-bell-function '(lambda ()))
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-startup-message t)
(windmove-default-keybindings) ; Shift + Arrow Key moves window focus
(blink-cursor-mode 0)
(column-number-mode t)
(setq-default indent-tabs-mode nil)
(setq-default line-spacing 0.2)
(savehist-mode 1)
(ffap-bindings)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)
(setq completion-ignore-case t)
(setq mouse-drag-copy-region t)
(global-font-lock-mode t)
;; (electric-pair-mode t)                  ; replaced by smartparens
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(global-hl-line-mode t)
(global-linum-mode t)
(setq linum-format "%4d ")
;; (global-subword-mode 1)                 ; for CamelCase
(setq scroll-preserve-screen-position t)
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)
(which-function-mode t)
(global-auto-revert-mode 1)

(setq-default mode-line-format          ; almost all are default
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
                mode-line-misc-info ; prepend this to mode-line-modes to display which-function-mode
                mode-line-modes
                mode-line-end-spaces))

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed nil) ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ; scroll window under mouse
(setq scroll-step 1) ; keyboard scroll one line at a time

;; editing in dired-mode
(require 'dired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; dabberv
;(setq *dabbervs-case-fold* t)
(setq dabberv-case-fold-search nil)
;(setq dabbrev-case-replace nil)

;; auto-mode-alist for misc file types.
(setq auto-mode-alist
      (append '(("Cask$" . lisp-mode)
                ("\\.xsd$" . xml-mode)
                ("\\.rng$" . xml-mode))
              auto-mode-alist))

;; creates emacs backup and autosave files in backup directory
(defvar user-temporary-file-directory "~/.emacs.d/backup")
(make-directory user-temporary-file-directory t)
(setq make-backup-files nil)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)))
(setq auto-save-default nil)
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; remembers cursor position
(setq save-place-file "~/.emacs.d/save-places")
(setq-default save-place t)
(require 'saveplace)
