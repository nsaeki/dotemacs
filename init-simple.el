(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat "~/.emacs.d/" path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "site-lisp")


(setq ring-bell-function '(lambda ()))
(setq inhibit-startup-message t)
(setq completion-ignore-case t)
(setq set-mark-command-repeat-pop t)
(setq mouse-drag-copy-region t)
(setq scroll-preserve-screen-position t)
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)

(ffap-bindings)

(when (display-graphic-p)
    (tool-bar-mode 0)
    (scroll-bar-mode 0)
    ;; Scroll one line at a time (less "jumpy" than defaults)
    (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; one line at a time
    (setq mouse-wheel-progressive-speed nil) ; don't accelerate scrolling
    (setq mouse-wheel-follow-mouse 't) ; scroll window under mouse
    (setq scroll-step 1) ; keyboard scroll one line at a time
)

(blink-cursor-mode 0)
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(setq blink-matching-paren nil)         ; suppress Match message in minibuffer
(savehist-mode 1)
(setq linum-format "%4d ")
(global-linum-mode t)
(column-number-mode t)
(global-font-lock-mode t)
;; Use global-hl-line-timer-function instead
;; (global-hl-line-mode t)
;; (electric-pair-mode t)                  ; use smartparens
(global-auto-revert-mode 1)
(which-function-mode t)
;; (global-subword-mode 1)                 ; for CamelCase
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list '(2 4 8))
(setq-default line-spacing 0.2)         ; a little wider
(defalias 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)

;; turn off shell command echo (from: https://www.emacswiki.org/emacs/MatthewOzorDotEmacs)
(defun my-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'my-comint-init)

;; Shift + Arrow Key moves window focus
(windmove-default-keybindings)

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

;; for Emacs Mac Port
(setq frame-title-format (format (if (buffer-file-name) "%%f" "%%b")))


;; Custom Keybindings
(when (display-graphic-p)
  (global-unset-key (kbd "C-x C-z"))
  (global-set-key (kbd "C-z") 'shell-pop))

(global-unset-key (kbd "C-h h"))        ; disable 'view-hello-file
(global-set-key (kbd "<M-return>") 'indent-new-comment-line)
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-tab>") 'previous-buffer)
(global-set-key (kbd "C-|") 'other-window-or-split)

;; (global-set-key (kbd "C-h") 'delete-backward-char)
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(global-set-key (kbd "M-?") 'help-command)

;; (global-set-key (kbd "M-z") 'zop-to-char)
(global-set-key (kbd "M-Z") 'zap-up-to-char)
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x j") 'open-junk-file)

(global-set-key (kbd "M-j") 'avy-goto-char-timer)
;; (global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(global-set-key (kbd "M-g .") 'my-projectile-helm-ag)
(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)

(global-set-key (kbd "C-M-m") 'bm-toggle)
(global-set-key (kbd "M-]") 'bm-next)
(global-set-key (kbd "M-[") 'bm-previous)

(global-set-key (kbd "C-c SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c C-SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-.") 'helm-imenu)
(global-set-key (kbd "M-.") 'helm-etags-select)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-o") 'helm-occur)
(global-set-key (kbd "C-M-o") 'helm-multi-occur)
(global-set-key (kbd "C-M-z") 'helm-resume)
(global-set-key (kbd "C-M-;") 'my-helm-for-files-in-project)
(global-set-key (kbd "C-'") 'my-helm-for-projects)

(global-set-key (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c A") 'mc/mark-all-dwim)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'bm-show-all)
(global-set-key (kbd "C-c c") 'smart-compile)
(global-set-key (kbd "C-c d") 'dash-at-point)
(global-set-key (kbd "C-c j") 'org-journal-new-entry)
;; (global-set-key (kbd "C-c j") 'neotree-toggle)
;; (global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-c n") 'my/open-notes-dir)
(global-set-key (kbd "C-c m") 'bm-toggle)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-c o") 'browse-url)
(global-set-key (kbd "C-c q") 'quickrun)
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c t") 'my-swap-buffer)
(global-set-key (kbd "C-c v") 'browse-url-of-file)
(global-set-key (kbd "C-c y") 'copy-file-name-to-clipboard)
(global-set-key (kbd "C-c f") 'my/search-web-dwim)
(global-set-key (kbd "C-c g") (lambda () (interactive) (my/search-web-dwim "google")))
(global-set-key (kbd "C-c e") (lambda () (interactive) (my/search-web-dwim "dict")))
(global-set-key (kbd "C-c =") 'vc-diff)

(global-set-key (kbd "C-x v p") 'projectile-dired)
