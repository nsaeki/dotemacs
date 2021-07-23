;; Use init.el only, doesn't load rc.d

;; Basic configurations
(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t)
(setq completion-ignore-case t)
(setq set-mark-command-repeat-pop t)
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)
(setq mouse-drag-copy-region t)
(setq scroll-preserve-screen-position t)

(ffap-bindings)
(blink-cursor-mode 0)
(savehist-mode 1)

(show-paren-mode 1)
(setq show-paren-style 'mixed)
(setq blink-matching-paren nil)         ; suppress Match message in minibuffer

(setq linum-format "%4d ")
(global-linum-mode t)
(column-number-mode t)

(global-auto-revert-mode 1)
(which-function-mode t)
;; (global-subword-mode 1)                 ; for CamelCase

(global-font-lock-mode t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list '(2 4 8))
(setq-default line-spacing 0.2)         ; a little wider
(defalias 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)

(when (display-graphic-p)
    (tool-bar-mode 0)
    (scroll-bar-mode 0)

    ;; Scroll one line at a time (less "jumpy" than defaults)
    (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; one line at a time
    (setq mouse-wheel-progressive-speed nil) ; don't accelerate scrolling
    (setq mouse-wheel-follow-mouse 't) ; scroll window under mouse
    (setq scroll-step 1) ; keyboard scroll one line at a time
)

;; turn off shell command echo (from: https://www.emacswiki.org/emacs/MatthewOzorDotEmacs)
(defun my-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'my-comint-init)

;; Shift + Arrow Key moves window focus
(windmove-default-keybindings)

;; dabberv
(setq dabberv-case-fold-search nil)

;; Remembers cursor position
(require 'saveplace)
(save-place-mode 1)

;; Editing in dired-mode
(require 'dired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; for emacsclient
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
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; save script file as executable
(defun make-file-executable ()
  "Make the file of this buffer executable, when it is a script source."
  (save-restriction
    (widen)
    (if (string= "#!" (buffer-substring-no-properties 1 (min 3 (point-max))))
        (let ((name (buffer-file-name)))
          (or (equal ?. (string-to-char (file-name-nondirectory name)))
              (let ((mode (file-modes name)))
                (set-file-modes name (logior mode (logand (/ mode 4) 73)))
                (message (concat "Wrote " name " (+x)"))))))))
(add-hook 'after-save-hook 'make-file-executable)

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; preserve scratch buffer
;; http://www-tsujii.is.s.u-tokyo.ac.jp/~yoshinag/tips/elisp_tips.html#scratch
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when initial-scratch-message
      (insert initial-scratch-message))
    (cond ((= arg 0) (message "*scratch* is cleared up."))
          ((= arg 1) (message "another *scratch* is created")))))
;; just clear when killing *scratch* buffer
(add-hook 'kill-buffer-query-functions
          (lambda ()
            (if (string= "*scratch*" (buffer-name))
                (progn (my-make-scratch 0) nil)
              t)))

(defun my-vc-rootdir ()
  "Return VCS root directory of current buffer file.
If the buffer is not in VCS, return nil"
  (interactive)
  (let ((backend (vc-deduce-backend)))
    (when backend
      (vc-call-backend backend 'root default-directory))))

(defun my-dired-jump-to-project-root ()
  "Open VCS root directory in dired mode if current buffer is in VCS.
Otherwise open current directory"
  nil
  (interactive)
  (let ((rootdir (my-vc-rootdir)))
    (if (and rootdir (file-directory-p rootdir))
        (dired-jump nil rootdir)
      (dired-jump))))

;; http://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

;; http://www.emacswiki.org/emacs/SearchAtPoint
(defun isearch-yank-symbol ()
  "*Put symbol at current point into search string."
  (interactive)
  (let ((sym (symbol-at-point)))
    (if sym
        (progn
          (setq isearch-regexp t
                isearch-string (concat "\\_<" (regexp-quote (symbol-name sym)) "\\_>")
                isearch-message (mapconcat 'isearch-text-char-description isearch-string "")
                isearch-yank-flag t))
      (ding)))
  (isearch-search-and-update))
(define-key isearch-mode-map (kbd "M-w") 'isearch-yank-symbol)

(require 'dired-x)
(require 'misc)                         ; for zap-up-to-char
;; (shell-command-completion-mode)



;;; Custom key bindings
(when (display-graphic-p)
  (global-unset-key (kbd "C-x C-z")))

(global-set-key (kbd "<M-RET>") 'indent-new-comment-line)
(global-unset-key (kbd "C-h h"))
(global-set-key (kbd "<M-return>") 'indent-new-comment-line)
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-tab>") 'previous-buffer)

(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(global-set-key (kbd "M-?") 'help-command)

(global-set-key (kbd "C-x \\") 'align-regexp)

(global-set-key (kbd "M-j") 'avy-goto-char-timer)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-.") 'helm-etags-select)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)


(global-set-key (kbd "M-o") 'helm-occur)
(global-set-key (kbd "C-.") 'helm-imenu)
(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-c SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c C-SPC") 'helm-all-mark-rings)

(global-set-key (kbd "C-c h") 'help-command)
(global-set-key (kbd "C-c s") 'toggle-truncate-lines)
(global-set-key (kbd "C-c j") 'avy-goto-char-timer)
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c y") 'copy-file-name-to-clipboard)
(global-set-key (kbd "C-c ;") 'helm-mini)
(global-set-key (kbd "C-c x") 'helm-M-x)
(global-set-key (kbd "C-c =") 'vc-diff)

(global-set-key (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c A") 'mc/mark-all-dwim)

(global-set-key (kbd "C-x v p") 'projectile-dired)


;; Straight.el
(setq package-enable-at-startup nil)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
   (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(straight-use-package 'el-patch)

;; (install-elisp "http://taiyaki.org/elisp/mell/src/mell.el")
;; (install-elisp "http://taiyaki.org/elisp/text-adjust/src/text-adjust.el")
(use-package text-adjust
  :load-path "site-lisp")

(use-package sequential-command-config
  :straight (:host github :repo "rubikitch/sequential-command")
  :config
  (sequential-command-setup-keys))

(use-package recentf-ext
  :straight t
  :init
  (setq recentf-max-saved-items 500)
  (setq recentf-exclude '("/TAGS$" "/var/tmp")))

;; dmacro
;; (autoload 'dmacro-exec "dmacro" nil t)
;; (require 'undohist)
;; (undohist-initialize)

(use-package volatile-highlights
  :straight t
  :config
  (volatile-highlights-mode t)
  (set-face-background 'vhl/default-face "#aa0"))

;; Goto Last Change
(use-package goto-chg
  :straight t)

(use-package all-ext
  :straight t)

(use-package migemo
  :straight t
  :init
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
  ;; for homebrewed migemo
  (when (file-exists-p "/usr/local/share/migemo/utf-8/migemo-dict")
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict"))
  (when (file-exists-p "/opt/homebrew/share/migemo/utf-8/migemo-dict")
    (setq migemo-dictionary "/opt/homebrew/share/migemo/utf-8/migemo-dict"))  
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (setq migemo-use-pattern-alist t)
  (setq migemo-use-frequent-pattern-alist t)
  (add-hook 'isearch-mode-hook
            (lambda ()
              (define-key isearch-mode-map "\C-y" 'isearch-yank-kill)
              (define-key isearch-mode-map "\M-y" 'migemo-isearch-yank-line))
            t)
  :config
  (migemo-init)
  (set-process-query-on-exit-flag (get-process "migemo") nil))

(use-package ag
  :straight t
  :init
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers t)
  (setq helm-ag-base-command "ag --vimgrep --no-heading")
  (setq helm-ag-insert-at-point 'symbol)
  (add-hook 'ag-mode-hook 'wgrep-ag-setup)
  :config
  (define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode))


(use-package helm
  :straight t
  :init
  (setq helm-truncate-lines t)
  (setq helm-buffer-max-length 35)
  (setq helm-delete-minibuffer-contents-from-point t)
  (setq helm-ff-skip-boring-files t)
  (setq helm-ls-git-show-abs-or-relative 'relative)
  (setq helm-ff-transformer-show-only-basename nil)
  (setq helm-mini-default-sources '(helm-source-buffers-list
                                    helm-source-recentf
                                    helm-source-files-in-current-dir))
  :config
  (require 'helm-occur)
  (helm-migemo-mode t)
  (define-key isearch-mode-map (kbd "M-o") 'helm-occur-from-isearch))

(use-package helm-ls-git
  :straight t
  :config
  ;;(add-to-list 'helm-mini-default-sources 'helm-source-ls-git)
  )

(use-package helm-descbinds
  :straight t
  :config
  (helm-descbinds-mode))

(use-package smartrep
  :straight t
  :config
  (smartrep-define-key
      global-map "C-c" '(("p" . 'goto-last-change)
                         ("n" . 'goto-last-change-reverse)
                         ;; ("i" . 'delete-indentation)
                         ("o" . er/expand-region)
                         ("i" . er/contract-region)
                         (">" . 'mc/mark-next-like-this)
                         ("<" . 'mc/mark-previous-like-this)))
  (smartrep-define-key
      global-map "C-x" '(("n" . 'my-vcs-next-hunk)
                         ("p" . 'my-vcs-previous-hunk)))
  (smartrep-define-key
      global-map "M-g" '(("n" . 'next-error)
                         ("p" . 'previous-error))))

(use-package key-chord
  :straight t
  :config
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.04)
  (key-chord-define-global "jk" 'evil-mode)
  (key-chord-define-global "df" 'vc-diff)
  (key-chord-define-global "vc" 'magit-status))

(use-package evil
  :straight t)

(use-package region-bindings-mode
  :straight t
  :config
  (region-bindings-mode-enable)
  (define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
  (define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
  (define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
  (define-key region-bindings-mode-map (kbd "<RET>") 'mc/edit-lines))

(use-package multiple-cursors
  :straight t)

(use-package smartparens
  :straight t
  :config
  (smartparens-global-mode t))
  
(use-package company
  :straight t
  :init
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  :config
  (global-company-mode)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-s") 'company-filter-candidates)
  (define-key company-active-map (kbd "TAB") 'company-complete-selection)
  (define-key company-active-map (kbd "RET") nil)
  ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
  (define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)
  (set-face-attribute 'company-tooltip nil
                      :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common nil
                      :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common-selection nil
                      :foreground "white" :background "steelblue")
  (set-face-attribute 'company-tooltip-selection nil
                      :foreground "black" :background "steelblue")
  (set-face-attribute 'company-preview-common nil
                      :background nil :foreground "lightgrey" :underline t)
  (set-face-attribute 'company-scrollbar-fg nil
                      :background "orange")
  (set-face-attribute 'company-scrollbar-bg nil
                      :background "gray40"))

(use-package anzu
  :straight t
  :init
  (setq anzu-mode-lighter "")
  (setq anzu-use-migemo t)
  (setq anzu-search-threshold 1000)
  :config
  (global-anzu-mode t))

(use-package expand-region
  :straight t)

(use-package highlight-symbol
  :straight t
  :config
  (highlight-symbol-mode)
  (highlight-symbol-nav-mode))

(use-package which-key
  :straight t
  :config
  (which-key-mode))

(use-package lsp-mode
  :straight t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (shell-script-mode . lsp)
  (css-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration)
  :commands lsp)

(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode)

(use-package helm-lsp
  :straight t
  :commands helm-lsp-workspace-symbol)


;; rc.d/40_path.el
;; rc.d/45_theme.el
;; rc.d/91_framesize.el

;; rc.d/70_golang.el
;; rc.d/70_js.el
;; rc.d/70_json.el
;; rc.d/70_markdown.el
;; rc.d/70_org.el
;; rc.d/70_php.el
;; rc.d/70_projectile.el
;; rc.d/70_python.el
;; rc.d/70_rainbow.el
;; rc.d/70_rest.el
;; rc.d/70_ruby.el
;; rc.d/70_scss.el
;; rc.d/70_sql.el
;; rc.d/70_vcs.el
;; rc.d/70_web.el
;; rc.d/70_yasnippet.el
;; rc.d/70_zencoding.el
;; rc.d/91_read-only-directory.el
