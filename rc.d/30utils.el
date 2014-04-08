(ensure-package-installed 'shell-command)
(require 'shell-command)
(shell-command-completion-mode)

(ensure-package-installed 'open-junk-file)
(require 'open-junk-file)
(setq open-junk-file-format "~/sandbox/%Y-%m-%d-%H%M%S.")
(global-set-key (kbd "C-c j") 'open-junk-file)

;; camelCase-mode
;; http://www.eecs.ucf.edu/~leavens/emacs/camelCase/camelCase-mode.el
;; Emacs 23 has `capitalized-words-mode', but it doesn't work correctly.
(autoload 'camelCase-mode "camelCase-mode" nil t)

;; ThingAtPoint and isearch-word-at-point
(require 'thingatpt)
(defun isearch-yank-symbol ()
  "*Put symbol at current point into search string."
  (interactive)
  (let ((sym (symbol-at-point)))
    (if sym
        (progn
          (setq isearch-regexp t
                isearch-string (concat "\\_<"
                                       (regexp-quote (symbol-name sym)) "\\_>")
                isearch-message (mapconcat
                                 'isearch-text-char-description isearch-string "")
                isearch-yank-flag t))
      (ding)))
  (isearch-search-and-update))
(define-key isearch-mode-map "\M-w" 'isearch-yank-symbol)

(ensure-package-installed 'sequential-command)
(require 'sequential-command-config)
(sequential-command-setup-keys)

(ensure-package-installed 'recentf-ext)
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("/TAGS$" "/var/tmp"))
(require 'recentf-ext)

(ensure-package-installed 'color-moccur)
(require 'color-moccur)
(setq moccur-split-word t)

;; (install-elisp "http://taiyaki.org/elisp/mell/src/mell.el")
;; (install-elisp "http://taiyaki.org/elisp/text-adjust/src/text-adjust.el")
(require 'text-adjust)

(ensure-package-installed 'point-undo)
(require 'point-undo)
(define-key global-map (kbd "C-z") 'point-undo)
(define-key global-map (kbd "C-M-z") 'point-redo)

;; dmacro
(defconst *dmacro-key* "\C-t" "repeat key")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)

;; sml-modeline-mode
(ensure-package-installed 'sml-modeline)
(require 'sml-modeline-autoloads)
(sml-modeline-mode t)
(set-face-foreground 'sml-modeline-end-face "#000000")
(set-face-background 'sml-modeline-end-face "#b0b0b0")
(set-face-foreground 'sml-modeline-vis-face "#000000")
(set-face-background 'sml-modeline-vis-face "#80c000")
