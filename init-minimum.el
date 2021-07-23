;;; Minimum configurations. No additional package required

(setq ring-bell-function '(lambda ()))
(setq inhibit-startup-message t)
(setq completion-ignore-case t)
(setq set-mark-command-repeat-pop t)
(setq eval-expression-print-length nil)
(setq eval-expression-print-level nil)

(ffap-bindings)

(blink-cursor-mode 0)
(savehist-mode 1)
(global-font-lock-mode t)
(global-auto-revert-mode 1)
(which-function-mode t)
(setq use-dialog-box nil)

;; dabberv
(setq dabberv-case-fold-search nil)

;; Editing in dired-mode
(require 'dired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

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

;;; Custom key bindings
(when (display-graphic-p)
  (global-unset-key (kbd "C-x C-z")))

(global-unset-key (kbd "C-h h"))        ; disable 'view-hello-file
(global-set-key (kbd "<M-return>") 'indent-new-comment-line)
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-tab>") 'previous-buffer)

(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(global-set-key (kbd "M-?") 'help-command)

(global-set-key (kbd "C-x \\") 'align-regexp)

(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c y") 'copy-file-name-to-clipboard)
(global-set-key (kbd "C-c =") 'vc-diff)


(when (eq system-type 'darwin)
  (when (display-graphic-p)
    ;; (mac-auto-ascii-mode 1)

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
