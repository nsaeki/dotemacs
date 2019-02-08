
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat "~/.emacs.d/" path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "site-lisp")

;;; Settings

(setq ring-bell-function '(lambda ()))
(setq inhibit-startup-message t)
(setq completion-ignore-case t)
(setq set-mark-command-repeat-pop t)
(setq mouse-drag-copy-region t)
(setq scroll-preserve-screen-position t)
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)
(setq custom-file (locate-user-emacs-file "custom.el"))
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list '(2 4 8))
(setq-default line-spacing 0.2)         ; a little wider
(defalias 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)

(savehist-mode 1)
(ffap-bindings)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(setq blink-matching-paren nil)         ; suppress Match message in minibuffer
(sml-modeline-mode t)
(setq linum-format "%4d ")
(global-linum-mode t)
(column-number-mode t)
(global-font-lock-mode t)
;; (electric-pair-mode t)                  ; use smartparens
(global-auto-revert-mode 1)
(which-function-mode t)
;; (global-subword-mode 1)                 ; for CamelCase

;; turn off shell command echo (from: https://www.emacswiki.org/emacs/MatthewOzorDotEmacs)
(defun my-comint-init ()
  (setq comint-process-echoes t))
(add-hook 'comint-mode-hook 'my-comint-init)

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

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed nil) ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)       ; scroll window under mouse
(setq scroll-step 1)              ; keyboard scroll one line at a time
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("/TAGS$" "/var/tmp"))
(setq dabberv-case-fold-search nil)
(setq frame-title-format (format (if (buffer-file-name) "%%f" "%%b")))

;; Creates backup and autosave files in backup directory
(defvar user-temporary-file-directory "~/.emacs.d/backup")
(make-directory user-temporary-file-directory t)
(setq make-backup-files nil)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)))
(setq auto-save-default nil)
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; Settings by system
(when (eq system-type 'windows-nt)
  ;; PATH
  (setq exec-path (cons "c:/cygwin/bin" exec-path))
  (setenv "PATH" (concat '"c:/cygwin/bin:" (getenv "PATH")))
  ;; (setq exec-path (cons "c:/cygwin/usr/bin" exec-path))
  ;; (setenv "PATH" (concat '"c:/cygwin/usr/bin:" (getenv "PATH")))
  ;; (setq exec-path (cons "c:/cygwin/usr/local/bin" exec-path))
  ;; (setenv "PATH" (concat '"c:/cygwin/usr/local/bin:" (getenv "PATH")))

  ;; shell command
  (add-hook 'comint-output-filter-functions
            'shell-strip-ctrl-m nil t)
  (add-hook 'comint-output-filter-functions
            'comint-watch-for-password-prompt nil t)
  (setq explicit-shell-file-name "bash.exe")
  ;; For subprocesses invoked via the shell
  ;; (e.g., "shell -c command")
  (setq shell-file-name explicit-shell-file-name)

  ;; Locale
  (setenv "LANG" "C")

  ;; cygwin
  (require 'cygwin-mount)
  (cygwin-mount-activate))

(when (eq system-type 'darwin)
  (when (display-graphic-p)
    (mac-auto-ascii-mode 1)

    ;; disable M-h to hide window and so on.
    (setq mac-pass-command-to-system nil)

    ;; Command-Key and Option-Key
    (setq ns-command-modifier (quote meta))
    (setq ns-alternate-modifier (quote super))
    (setq ns-pop-up-frames nil)

    ;; drag and drop
    (define-key global-map [ns-drag-file] 'ns-find-file)

    ;; font
    ;; Ref. http://extra-vision.blogspot.jp/2016/07/emacs.html
    (when (>= emacs-major-version 23)
      (create-fontset-from-ascii-font
       "Menlo"
       nil
       "Menlo_Hiragino")

      (add-to-list 'default-frame-alist '(font . "fontset-Menlo_Hiragino"))

      (set-fontset-font
       "fontset-Menlo_Hiragino"
       ;; 'unicode
       'japanese-jisx0213.2004-1
       (font-spec :family "Hiragino Sans W3" :size 12)
       nil
       'append))))

;;; Custom functions

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

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p) (split-window-sensibly))
  (other-window 1))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun align-repeat (start end regexp)
  "Repeat alignment with respect to
     the given regular expression."
  (interactive "r\nsAlign regexp: ")
  (align-regexp start end
                (concat "\\(\\s-*\\)" regexp) 1 1 t))

(defun my-swap-buffers (arg)
  "Swap buffers with next window"
  (interactive "p")
  (let* ((current (selected-window))
         ;; Zero means this does not select minibuffer even if it's active
         (other (next-window current 0))
         (current-buf (window-buffer current)))
    (unless (or (eq current other)
                (window-minibuffer-p current))
      (set-window-buffer (selected-window) (window-buffer other))
      (set-window-buffer other current-buf)
      (if (= arg 1) (select-window other)))))

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
    (or arg (progn (setq arg 0)
                   (switch-to-buffer "*scratch*")))
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

(setq my/journal-directory "~/notes/journal")
(defun my/open-journal (&optional filename)
  (interactive)
  (let ((filename (or filename (format-time-string "%Y%m%d"))))
    (find-file (concat my/journal-directory "/" filename ".md"))
    (goto-char (point-max))
    (org-show-entry)))

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

;; marked
;; http://support.markedapp.com/kb/how-to-tips-and-tricks/marked-bonus-pack-scripts-commands-and-bundles
(defun marked ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a 'Marked 2' %s"
       (shell-quote-argument (buffer-file-name)))))

;;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (el-get-bundle nsaeki/envcache.el)
(el-get-bundle nsaeki/read-only-directory.el)
(el-get-bundle nsaeki/idlefingers-emacs)
;; (el-get-bundle sugyan/helm-go-package :checkout "52d6ed2dca82d860d63ef654e85a9dd762c272f5")
(el-get-bundle antonj/scss-mode)

;;; Colors and themes

(require 'cl)
(when (display-graphic-p)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory "~/.emacs.d/themes/"))
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory "~/.emacs.d/el-get/idlefingers-emacs/"))
  (load-theme 'idlefingers t)

  ;; some customizations
  (custom-set-faces
   '(default ((t (:foreground "#d9d9d9"))))
   '(font-lock-comment-face ((t (:foreground "dim gray" :italic nil))))
   '(paren-face ((t (:foreground "#A6E22A" :background nil))))
   '(show-paren-match-face ((t (:foreground "#1B1D1E" :background "goldenrod3"))))
   '(linum ((t (:inherit (shadow default) :foreground "dim gray" :background "#333"))))
   '(mode-line ((t (:background "#e3e3e3" :foreground "#000000"))))
   '(sml-modeline-vis-face ((t (:background "#a0e000" :foreground "#000000"))))
   '(sml-modeline-end-face ((t (:background "#bcb9ba" :foreground "#000000"))))

   '(which-func ((t (:foreground "forest green"))))
   '(anzu-mode-line ((t (:foreground "chocolate" :bold t)))))

  ;; change mode-line color by evil state
  (lexical-let ((default-color (cons (face-background 'mode-line)
                                     (face-foreground 'mode-line))))
    (add-hook 'post-command-hook
              (lambda ()
                (let ((color (cond ((minibufferp) default-color)
                                   ((evil-normal-state-p)   '("#44789c" . "#000000"))
                                   ((evil-insert-state-p)   '("#00bff1" . "#000000"))
                                   ((evil-visual-state-p)   '("#44789c" . "#000000"))
                                   ((evil-operator-state-p) '("#44789c" . "#000000"))
                                   ((evil-replace-state-p)  '("#44789c" . "#000000"))
                                   ((evil-motion-state-p)   '("#f1e896" . "#000000"))
                                   ((evil-emacs-state-p)    '("#444488" . "#000000"))
                                   (view-mode  '("tomato3" . "#000000"))
                                   (t default-color))))
                  (set-face-background 'mode-line (car color))
                  (set-face-foreground 'mode-line (cdr color)))))))

;;; Packages

;; (use-package auto-async-byte-compile
;;   :defer t
;;   :init
;;   (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))

(use-package shell-command
  :commands (shell-command shell-command-on-region grep grep-find compile)
  :config
  (shell-command-completion-mode t))

(use-package saveplace
  :config
  (setq save-place-file "~/.emacs.d/save-places")
  (setq-default save-place t))

(use-package dired
  :config
  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode))
(use-package dired-x)

(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

(use-package misc
  :commands zap-up-to-char
  :config
  (global-set-key (kbd "M-Z") 'zap-up-to-char))

(use-package open-junk-file
  :defer t
  :init
  (setq open-junk-file-find-file-function 'find-file)
  (setq open-junk-file-format "~/sandbox/%Y%m%d%H%M%S."))

(use-package sequential-command-config
  :config
  (sequential-command-setup-keys))

(use-package recentf-ext)

;; (install-elisp "http://taiyaki.org/elisp/mell/src/mell.el")
;; (install-elisp "http://taiyaki.org/elisp/text-adjust/src/text-adjust.el")
(use-package text-adjust)
(use-package volatile-highlights
  :config
  (volatile-highlights-mode t)
  (set-face-background 'vhl/default-face "#aa0"))

(use-package goto-chg)
(use-package all-ext)

(use-package search-web
  :config
  ;; Still using my version of search-web-dwim becuase original version of
  ;; this function is a bit inconvenient for me (commented below).
  (defun my/search-web-dwim (&optional engine word)
    (interactive)
    (let* ((completion-ignore-case t)
           (use-empty-active-region nil)
           ;; Set default engine to google whatever search-engine-history has.
           (engine (or engine
                       (completing-read "Search engine (default google): "
                                        search-web-engines nil t nil
                                        'search-web-engine-history "google")))
           (word (cond
                  (word)
                  ((use-region-p) (buffer-substring-no-properties
                                   (region-beginning) (region-end)))
                  ((thing-at-point 'symbol t))
                  (t (read-string "Search Word: " nil 'search-web-word-history)))))
      (search-web engine word)))
  (when (eq system-type 'darwin)
    (add-to-list 'search-web-engines '("dict" "dict:///%s" nil))))

(use-package migemo
  :init
  ;; for C/Migemo
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (setq migemo-use-pattern-alist t)
  (setq migemo-use-frequent-pattern-alist t)

  ;; for Mac OS X Homebrewed cmigemo
  (when (file-executable-p "/usr/local/bin/cmigemo")
    (setq migemo-command "/usr/local/bin/cmigemo"))
  (when (file-exists-p "/usr/local/share/migemo/utf-8/migemo-dict")
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict"))

  :config
  (migemo-init)
  (set-process-query-on-exit-flag (get-process "migemo") nil)

  ;; rewrite migemo isearch key-map
  (add-hook 'isearch-mode-hook
            (lambda ()
              (define-key isearch-mode-map "\C-y" 'isearch-yank-kill)
              (define-key isearch-mode-map "\M-y" 'migemo-isearch-yank-line))
            t))

(use-package ag
  :init
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers t)
  (setq helm-ag-base-command "rg --vimgrep --no-heading")
  :config
  (add-hook 'ag-mode-hook 'wgrep-ag-setup)
  (define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode))

(use-package bm
  :init
  (setq bm-repository-file "~/.emacs.d/bm-repository")
  (setq bm-restore-repository-on-load t)
  (setq bm-buffer-persistence t)
  (setq bm-persistent-face 'bm-face)
  :config
  (add-hook 'after-init-hook 'bm-repository-load)
  (add-hook 'find-file-hooks 'bm-buffer-restore)
  (add-hook 'after-revert-hook 'bm-buffer-restore)
  (add-hook 'after-save-hook 'bm-buffer-save)
  (add-hook 'vc-before-checkin-hook 'bm-buffer-save)
  (add-hook 'kill-buffer-hook 'bm-buffer-save)
  (add-hook 'kill-emacs-hook '(lambda nil
                                (bm-buffer-save-all)
                                (bm-repository-save))))

(use-package helm
  :defer t
  :config
  (helm-migemo-mode t)
  (define-key isearch-mode-map (kbd "M-o") 'helm-occur-from-isearch)
  (helm-descbinds-mode t)
  (use-package helm-config)
  (use-package helm-bm
    :config
    (push '(migemo) helm-source-bm))
  (use-package helm-imenu
    :config
    (push '(migemo) helm-source-imenu))
  (use-package helm-ls-git)
  (use-package helm-ghq))

(use-package key-chord
  :config
  (key-chord-mode t)
  (setq key-chord-two-keys-delay 0.04)
  (key-chord-define-global "jk" 'evil-mode)
  (key-chord-define-global "df" 'vc-diff)
  (key-chord-define-global "vc" 'magit-status))

(use-package exec-path-from-shell
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package region-bindings-mode
  :config
  (region-bindings-mode-enable)
  (define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
  (define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
  (define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
  (define-key region-bindings-mode-map (kbd "<return>") 'mc/edit-lines))

(use-package smartparens-config
  :config
  (smartparens-global-mode t))

(use-package undo-tree
  :defer t
  :config
  (global-undo-tree-mode))

(use-package whitespace
  :init
  (setq whitespace-style '(face         ; faceで可視化
                           trailing     ; 行末
                           tabs         ; タブ
                           spaces       ; スペース
                           empty        ; 先頭/末尾の空行
                           space-mark   ; 表示のマッピング
                           tab-mark))
  (setq whitespace-display-mappings
        ;; '((space-mark ?\u3000 [?\u25a1])
        '((space-mark ?\u3000 [?\uff3f])
          ;; WARNING: the mapping below has a problem.
          ;; When a TAB occupies exactly one column, it will display the
          ;; character ?\xBB at that column followed by a TAB which goes to
          ;; the next TAB column.
          ;; If this is a problem for you, please, comment the line below.
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  ;; スペースは全角のみを可視化
  (setq whitespace-space-regexp "\\(\u3000+\\)")

  :config
  (global-whitespace-mode 1)
  (defvar my/bg-color "#282828")
  (set-face-attribute 'whitespace-trailing nil
                      :background my/bg-color
                      :foreground "DeepPink"
                      :underline t)
  (set-face-attribute 'whitespace-tab nil
                      :background my/bg-color
                      :foreground "#363636"
                      ;; underline stains modeline (confirmed in Emacs 24.4).
                      ;; :underline t
                      )
  (set-face-attribute 'whitespace-space nil
                      :background my/bg-color
                      :foreground "#484848"
                      :weight 'bold)
  (set-face-attribute 'whitespace-empty nil
                      :background my/bg-color))

(use-package auto-save-buffers-enhanced
  :init
  (setq auto-save-buffers-enhanced-exclude-regexps '("^/scp:"
                                                     "^/scpc:"
                                                     "^/ssh:"
                                                     "/sudo:"
                                                     "/multi:"))
  (setq auto-save-buffers-enhanced-interval 1)
  :config
  (auto-save-buffers-enhanced t))

(use-package smartrep
  :config
  ;; smartrep
  (smartrep-define-key
      global-map "C-c" '(("u" . 'goto-last-change)
                         ("U" . 'goto-last-change-reverse)
                         ("i" . 'delete-indentation)))
  (smartrep-define-key
      global-map "C-x" '(("n" . 'my-vcs-next-hunk)
                         ("p" . 'my-vcs-previous-hunk)))
  (smartrep-define-key
      global-map "M-g" '(("n" . 'next-error)
                         ("p" . 'previous-error))))

(use-package evil)

(use-package view
  :init
  (setq view-read-only t)
  :config
  ;; like less
  (define-key view-mode-map (kbd "N") 'View-search-last-regexp-backward)
  (define-key view-mode-map (kbd "?") 'View-search-regexp-backward)
  (define-key view-mode-map (kbd "f") 'View-scroll-page-forward)
  (define-key view-mode-map (kbd "b") 'View-scroll-page-backward)
  (define-key view-mode-map (kbd "G") 'View-goto-percent)
  ;; like vi
  (define-key view-mode-map (kbd "h") 'backward-char)
  (define-key view-mode-map (kbd "j") 'next-line)
  (define-key view-mode-map (kbd "k") 'previous-line)
  (define-key view-mode-map (kbd "l") 'forward-char)
  (define-key view-mode-map (kbd "J") 'View-scroll-line-forward)
  (define-key view-mode-map (kbd "K") 'View-scroll-line-backward)
  ;; bm.el
  (define-key view-mode-map (kbd "m") 'bm-toggle)
  (define-key view-mode-map (kbd "[") 'bm-previous)
  (define-key view-mode-map (kbd "]") 'bm-next))

(use-package viewer
  :init
  (setq viewer-modeline-color-unwritable "dark slate blue")
  (setq viewer-modeline-color-view "tomato3")
  (setq view-mode-by-default-regexp "\\(?:[_.]log\\|\.gz\\)$")

  :config
  ;; Force view-mode if file is read-only
  (viewer-stay-in-setup)
  ;; この時点でのmodeline colorがデフォルトになるので注意
  (viewer-change-modeline-color-setup))

(use-package anzu
  :config
  (global-anzu-mode t))

(use-package company
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
  (define-key company-active-map (kbd "<return>") nil)
  ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
  (define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)
  (set-face-attribute 'company-tooltip nil :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common nil :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common-selection nil :foreground "white" :background "steelblue")
  (set-face-attribute 'company-tooltip-selection nil :foreground "black" :background "steelblue")
  (set-face-attribute 'company-preview-common nil :background nil :foreground "lightgrey" :underline t)
  (set-face-attribute 'company-scrollbar-fg nil :background "orange")
  (set-face-attribute 'company-scrollbar-bg nil :background "gray40"))

(use-package expand-region
  :init
  (global-set-key (kbd "C-,") 'er/expand-region)
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package highlight-symbol)
(use-package auto-highlight-symbol
  :config
  (global-auto-highlight-symbol-mode t))

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c A") 'mc/mark-all-dwim))

(use-package shell-pop)

(use-package lsp-mode
  :init
  (setq lsp-auto-guess-root t)
  :config
  (add-hook 'shell-script-mode-hook #'lsp)
  (add-hook 'css-mode-hook #'lsp)
  (add-hook 'go-mode-hook #'lsp)
  (use-package lsp-ui
    :init
    (setq lsp-ui-doc-enable nil)
    :config
    (add-hook 'lsp-mode-hook 'lsp-ui-mode))
  (use-package company-lsp
    :config
    (push 'company-lsp company-backends)))

(use-package go-mode
  :defer t
  :config
  (define-key go-mode-map (kbd "C-c ,") 'go-test-mode-map)
  (define-key go-mode-map (kbd "C-c C-r") 'go-remove-unused-imports)
  (define-key go-mode-map (kbd "C-c C-l") 'golint)
  (substitute-key-definition 'go-import-add 'helm-go-package go-mode-map)
  (add-hook 'go-mode-hook 'flycheck-mode)

  ;; http://syohex.hatenablog.com/entry/20130618/1371567527
  (defvar my/helm-go-source
    '((name . "Helm Go")
      (candidates . go-packages)
      (action . (("Show document" . godoc)
                 ("Import package" . my/helm-go-import-add)))))
  (defun my/helm-go-import-add (candidate)
    (dolist (package (helm-marked-candidates))
      (go-import-add current-prefix-arg package)))
  (defun my/helm-godoc ()
    (interactive)
    (helm :sources '(my/helm-go-source) :buffer "*helm godoc*"
          :buffer "*helm godoc*"))

  (use-package gotest
    :config
    (define-prefix-command 'go-test-mode-map)
    (define-key go-test-mode-map (kbd "s") 'go-test-current-test)
    (define-key go-test-mode-map (kbd "f") 'go-test-current-file)
    (define-key go-test-mode-map (kbd "a") 'go-test-current-project)
    (define-key go-test-mode-map (kbd "c") 'go-test-current-coverage)
    (define-key go-test-mode-map (kbd "x") 'go-run))

  (use-package golint))

(use-package json)

(use-package markdown-mode
  :defer t
  :init
  (add-hook 'markdown-mode-hook
            '(lambda ()
               (setq imenu-create-index-function 'markdown-imenu-create-index)
               (local-set-key (kbd "C-M-m") 'markdown-insert-list-item)))
  (custom-set-faces '(markdown-header-face-1 ((t (:inherit outline-1 :weight bold))))
                    '(markdown-header-face-2 ((t (:inherit outline-2 :weight bold))))
                    '(markdown-header-face-3 ((t (:inherit outline-3 :weight bold))))
                    '(markdown-header-face-4 ((t (:inherit outline-4 :weight bold))))
                    '(markdown-header-face-5 ((t (:inherit outline-5 :weight bold))))
                    '(markdown-header-face-6 ((t (:inherit outline-6 :weight bold))))
                    '(markdown-pre-face ((t (:inherit org-formula)))))
  :config
  (defun markdown-imenu-create-index ()
    (let* ((root '(nil . nil))
           cur-alist
           (cur-level 0)
           (pattern "^\\(\\(#+\\)[ \t]*\\(.+\\)\\|\\([^# \t\n=-].*\\)\n===+\\|\\([^# \t\n=-].*\\)\n---+\\)$")
           (empty-heading "-")
           (self-heading ".")
           hashes pos level heading)
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward pattern (point-max) t)
          (cond
           ((setq hashes (match-string-no-properties 2))
            (setq heading (match-string-no-properties 3)
                  pos (match-beginning 1)
                  level (length hashes)))
           ((setq heading (match-string-no-properties 4))
            (setq pos (match-beginning 4)
                  level 1))
           ((setq heading (match-string-no-properties 5))
            (setq pos (match-beginning 5)
                  level 2)))
          (let ((alist (list (cons heading pos))))
            (cond
             ((= cur-level level)       ; new sibling
              (setcdr cur-alist alist)
              (setq cur-alist alist))
             ((< cur-level level)       ; first child
              (dotimes (i (- level cur-level 1))
                (setq alist (list (cons empty-heading alist))))
              (if cur-alist
                  (let* ((parent (car cur-alist))
                         (self-pos (cdr parent)))
                    (setcdr parent (cons (cons self-heading self-pos) alist)))
                (setcdr root alist))    ; primogenitor
              (setq cur-alist alist)
              (setq cur-level level))
             (t                         ; new sibling of an ancestor
              (let ((sibling-alist (last (cdr root))))
                (dotimes (i (1- level))
                  (setq sibling-alist (last (cdar sibling-alist))))
                (setcdr sibling-alist alist)
                (setq cur-alist alist))
              (setq cur-level level)))))
        (cdr root)))))

(use-package org
  :defer t
  :init
  (setq org-startup-folded 'nofold)
  (setq org-imenu-depth 4)
  (define-key org-mode-map (kbd "C-'") nil)
  (define-key org-mode-map (kbd "C-c a") 'org-agenda)

  :config
  (defun org-insert-upheading (arg)
    "insert upheading"
    (interactive "P")
    (org-insert-heading arg)
    (cond ((org-at-heading-p) (org-do-promote))
          ((org-at-item-p) (org-indent-item))))

  (defun org-insert-heading-dwim (arg)
    nil
    (interactive "P")
    (case arg
      (4  (org-insert-subheading nil))  ; C-u
      (16 (org-insert-upheading nil))   ; C-u C-u
      (t  (org-insert-heading nil)))))

(use-package org-journal
  :defer t
  :commands org-journal-new-entry
  :init
  ;; (setq org-journal-file-format "%Y%m%d.org")
  (setq org-journal-file-format "journal.org")
  (setq org-journal-date-format "%F")
  (setq org-journal-time-format "<%Y-%m-%d %R> ")
  (setq org-journal-dir "~/notes/journal")
  (push org-journal-dir org-agenda-files))

(use-package ox-gfm)

(use-package projectile
  :config
  (projectile-mode t)
  (defun my-projectile-helm-ag (arg)
    (interactive "p")
    (case arg
      (4 (helm-ag nil))
      (t (helm-ag (when (projectile-project-p)
                    (projectile-project-root))))))
  (global-set-key (kbd "C-x v p") 'projectile-dired))

(use-package helm-projectile
  :config
  (defun my-helm-for-projects ()
    "Helm for projectile projects and ghq list"
    (interactive)
    (helm :sources '(helm-source-projectile-projects
                     helm-source-ghq)
          :buffer "*helm for project*"))

  (defun my-helm-for-files-in-project ()
    "Helm for file and buffers in current project"
    (interactive)
    (helm :sources '(helm-source-projectile-buffers-list
                     helm-source-projectile-recentf-list
                     helm-source-projectile-files-list)
          :buffer "*helm for project*"))

  (setq projectile-enable-caching t)
  (helm-projectile-toggle 1))

(use-package python
  :defer t
  :init
  (add-hook 'python-mode-hook #'lsp)
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
   ;; python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(use-package rainbow-mode
  :init
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'scss-mode-hook 'rainbow-mode)
  (add-hook 'html-mode-hook 'rainbow-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-mode))

(use-package ruby-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("Berksfile$" . ruby-mode))
  (add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
  (add-hook 'ruby-mode-hook #'lsp)
  (add-hook 'ruby-mode-hook 'yard-mode)
  (add-hook 'ruby-mode-hook 'ruby-test-mode)
  (setq ruby-insert-encoding-magic-comment nil)

  :config
  (use-package rbenv
    :config
    (setq rbenv-show-active-ruby-in-modeline nil)
    (global-rbenv-mode))
  ;; launch pry in inf-ruby
  (use-package inf-ruby
    :config
    (setq inf-ruby-default-implementation "pry")
    (define-key inf-ruby-minor-mode-map (kbd "C-c C-z")
      (lambda () (interactive) (inf-ruby))))
  (use-package yard-mode)
  (use-package ruby-test-mode
    :config
    ;; Recognize test_*.rb as a test file
    (defun my-advice:ruby-prefixed-test-p (filename)
      (and (string-match "^test_" (file-name-base filename))
           (string-match "^rb$" (file-name-extension filename))))
    (advice-add 'ruby-test-p :after-until 'my-advice:ruby-prefixed-test-p)
    (advice-add 'minitest-test-file-p :after-until
                'my-advice:ruby-prefixed-test-p))

  ;; open gem source
  ;; http://d.hatena.ne.jp/kitokitoki/20110302/p1
  (defvar helm-gem-open-ruby-command "ruby -rubygems -e 'puts Dir[\"{#{Gem::Specification.dirs.join(\",\")}}/*.gemspec\"].collect {|s| File.basename(s).gsub(/\.gemspec$/, \"\")}'")
  (defvar helm-c-source-gem-open
    '((name . "gem open")
      (init . (lambda ()
                (let ((buffer (helm-candidate-buffer 'global)))
                  (with-current-buffer buffer
                    (call-process-shell-command helm-gem-open-ruby-command  nil buffer)
                    (sort-lines nil (point-min) (point-max))))))
      (candidates-in-buffer)
      (candidate-number-limit . 99999)
      (action ("Open" . helm-c-source-gem-open-action))))

  (defun helm-c-source-gem-open-action (candidate)
    (unless (executable-find "which-gemfile.rb")
      (error "couldn't find which-gemfile.rb in your path."))
    (find-file (with-temp-buffer
                 (call-process "which-gemfile.rb" nil t 0 candidate)
                 (delete-char 1)
                 (buffer-string))))

  (defun helm-gem-open ()
    (interactive)
    (helm helm-c-source-gem-open))
  (defalias 'gem 'helm-gem-open))

(use-package scss-mode
  :defer
  :init
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode)))

(use-package sql
  :defer t
  :config
  (use-package sql-indent
    :init
    (setq sql-indent-first-column-regexp
          (concat "\\(^\\s-*\\("
                  (regexp-opt '("select" "update" "insert" "delete"
                                "union" "intersect"
                                "from" "where" "into" "group" "having" "order"
                                "set"
                                "create" "drop" "truncate")
                              'symbols)
                  "\\|--\\)\\(\\b\\|\\s-\\)\\)\\|\\(^```$\\)"))))

(use-package magit
  :defer t
  :init
  (setq magit-last-seen-setup-instructions "1.4.0"))

(use-package git-gutter-fringe
  :config
  ;; small and a little left
  (fringe-helper-define 'git-gutter-fr:added nil
    "........"
    "..XX...."
    "..XX...."
    "XXXXXX.."
    "XXXXXX.."
    "..XX...."
    "..XX...."
    "........")
  (fringe-helper-define 'git-gutter-fr:deleted nil
    "........"
    "........"
    "........"
    "XXXXXX.."
    "XXXXXX.."
    "........"
    "........"
    "........")
  (fringe-helper-define 'git-gutter-fr:modified nil
    "........"
    ".XXX...."
    ".XXX...."
    ".XXX...."
    ".XXX...."
    ".XXX...."
    ".XXX...."
    "........"))

(use-package diff-hl
  :defer t
  :init
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (setq diff-hl-draw-borders nil)
  (setq diff-hl-side 'right)
  :config
  (global-diff-hl-mode t)
  (diff-hl-margin-mode)
  (defalias 'my-vcs-next-hunk 'diff-hl-next-hunk)
  (defalias 'my-vcs-previous-hunk 'diff-hl-previous-hunk))

(use-package web-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '(".php$" . web-mode))
  (add-hook 'web-mode-hook
            '(lambda ()
               (setq web-mode-enable-auto-indentation nil))))

(use-package php-mode
  :defer t
  :init
  (add-hook 'php-mode-hook #'lsp)
  (add-hook 'php-mode-hook
            '(lambda ()
               (local-set-key (kbd "C-.") 'helm-imenu)
               (local-set-key (kbd "C-c C-.") 'php-show-arglist)))
  (autoload 'php-imenu-create-index "php-imenu" nil t)
  (add-hook 'php-mode-hook 'php-imenu-setup)
  :config
  (defun php-imenu-setup ()
    (setq imenu-create-index-function (function php-imenu-create-index))
    (imenu-add-menubar-index)))

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package zencoding-mode
  :defer t
  :init
  (add-hook 'sgml-mode-hook 'zencoding-mode))

;; Restore frame size
;; Source: http://d.hatena.ne.jp/Tan90909090/20121124/1353757368
;; Edit and snip some comment
(when (display-graphic-p)
  (defconst my-save-frame-file "~/.emacs.d/.framesize")

  (defun my-save-frame-size()
    "Save current frame position and size into `my-save-frame-file'"
    (interactive)
    (let* ((param (frame-parameters (selected-frame)))
           (current-height (frame-height))
           (current-width (frame-width))
           (current-top-margin (if (listp (assoc-default 'top param))
                                   (car (cdr (assoc-default 'top param)))
                                 (assoc-default 'top param)))
           (current-left-margin (if (listp (assoc-default 'left param))
                                    (car (cdr (assoc-default 'left param)))
                                  (assoc-default 'left param)))
           (file my-save-frame-file))
      (with-temp-file file
        (insert
         (format "(set-frame-position (selected-frame) %d %d)\n"
                 current-left-margin current-top-margin))
        (insert
         (format "(set-frame-size (selected-frame) %d %d)"
                 current-width current-height)))))

  (defun my-load-frame-size()
    "Restore frame position and size from `my-save-frame-file'"
    (interactive)
    (let ((file my-save-frame-file))
      (when (file-exists-p file)
        (load-file file))))

  (add-hook 'emacs-startup-hook 'my-load-frame-size)
  (add-hook 'kill-emacs-hook 'my-save-frame-size)
  (run-with-idle-timer 60 t 'my-save-frame-size))

(require 'read-only-directory)
(read-only-directory-init)

(defun my-read-only-directory ()
  (interactive)
  (read-only-mode t)
  (read-only-directory (when (projectile-project-p)
                         (projectile-project-root))))

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

(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x j") 'open-junk-file)

(global-set-key (kbd "M-j") 'avy-goto-char-timer)
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

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'bm-show-all)
(global-set-key (kbd "C-c c") 'smart-compile)
(global-set-key (kbd "C-c d") 'dash-at-point)
(global-set-key (kbd "C-c j") 'org-journal-new-entry)
(global-set-key (kbd "C-c m") 'bm-toggle)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-c o") 'browse-url)
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)
(global-set-key (kbd "C-c y") 'copy-file-name-to-clipboard)
(global-set-key (kbd "C-c f") 'my/search-web-dwim)
(global-set-key (kbd "C-c g") (lambda () (interactive) (my/search-web-dwim "google")))
(global-set-key (kbd "C-c e") (lambda () (interactive) (my/search-web-dwim "dict")))
(global-set-key (kbd "C-c =") 'vc-diff)

