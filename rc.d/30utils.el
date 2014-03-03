;(require 'memo-mode)
;(require 'embed-memo)

(require 'shell-command)
(shell-command-completion-mode)

;; default in Emacs 23 or later
;(require 'physical-line)
;(setq-default physical-line-mode t)
;(setq physical-line-ignoring-mode-list '(dired-mode))

;; (require 'browse-kill-ring)
;; (browse-kill-ring-default-keybindings)
;; ;(global-set-key "\M-y" 'browse-kill-ring)
;; (define-key browse-kill-ring-mode-map (kbd "j") 'browse-kill-ring-forward)
;; (define-key browse-kill-ring-mode-map (kbd "k") 'browse-kill-ring-previous)
;; (define-key browse-kill-ring-mode-map (kbd "C-g") 'browse-kill-ring-quit)
;; ;(setq browse-kill-ring-display-style 'one-line)
;; ;(setq browse-kill-ring-resize-window nil)

;(require 'develock)
;(require 'jaspace)

; (require 'linum)
; (global-linum-mode t)
; (setq linum-format "%4d ")

;; (install-elisp-from-emacswiki "open-junk-file.el")
;; (require 'open-junk-file)

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

;; (auto-install-batch "sequential-command")
(require 'sequential-command-config)
(sequential-command-setup-keys)

;; (install-elisp-from-emacswiki "recentf-ext.el")
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("/TAGS$" "/var/tmp"))
(require 'recentf-ext)

;; (install-elisp-from-emacswiki "tempbuf.el")
;(require 'tempbuf)
;(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

;; (install-elisp-from-emacswiki "color-moccur.el")
(require 'color-moccur)
(setq moccur-split-word t)

;; (install-elisp-from-emacswiki "moccur-edit.el")
;(require 'moccur-edit)
;(setq moccur-split-word t)

;; (install-elisp-from-emacswiki "column-marker.el")
;(require 'column-marker)

;; (install-elisp "http://taiyaki.org/elisp/mell/src/mell.el")
;; (install-elisp "http://taiyaki.org/elisp/text-adjust/src/text-adjust.el")
(require 'text-adjust)

;; (install-elisp-from-emacswiki "summarye.el")
;(require 'summarye)

;; (install-elisp-from-emacswiki "multiverse.el")
;(require 'multiverse)

;; (install-elisp-from-emacswiki "point-undo.el")
(require 'point-undo)
(define-key global-map (kbd "C-z") 'point-undo)
(define-key global-map (kbd "C-M-z") 'point-redo)
;; (define-key global-map [f5] 'point-undo)
;; (define-key global-map [f6] 'point-redo)

;; AutoPairs
(require 'autopair)
(autopair-global-mode)
(setq autopair-blink nil)
(add-hook 'c++-mode-hook
          #'(lambda ()
              (push '(?< . ?>)
                    (getf autopair-extra-pairs :code))))
(add-hook 'python-mode-hook
          #'(lambda ()
              (setq autopair-handle-action-fns
                    (list #'autopair-default-handle-action
                          #'autopair-python-triple-quote-action))))

;; dmacro
(defconst *dmacro-key* "\C-t" "repeat key")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)

;; sml-modeline-mode
(require 'sml-modeline-autoloads)
(sml-modeline-mode t)
(set-face-foreground 'sml-modeline-end-face "#000000")
(set-face-background 'sml-modeline-end-face "#b0b0b0")
(set-face-foreground 'sml-modeline-vis-face "#000000")
(set-face-background 'sml-modeline-vis-face "#80c000")
