;; (require 'shell-command)
(shell-command-completion-mode)

(require 'open-junk-file)
(setq open-junk-file-format "~/sandbox/%Y%m%d%H%M%S.")

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

(require 'sequential-command-config)
(sequential-command-setup-keys)

(setq recentf-max-saved-items 500)
(setq recentf-exclude '("/TAGS$" "/var/tmp"))
(require 'recentf-ext)

;; (install-elisp "http://taiyaki.org/elisp/mell/src/mell.el")
;; (install-elisp "http://taiyaki.org/elisp/text-adjust/src/text-adjust.el")
(require 'text-adjust)

;; dmacro
;; (autoload 'dmacro-exec "dmacro" nil t)

;; sml-modeline-mode
(sml-modeline-mode t)

;; midnight mode for clean-buffer-list
;; (require 'midnight)

;; marked
;; http://support.markedapp.com/kb/how-to-tips-and-tricks/marked-bonus-pack-scripts-commands-and-bundles
(defun marked ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a 'Marked 2' %s"
       (shell-quote-argument (buffer-file-name)))))

(require 'volatile-highlights)
(volatile-highlights-mode t)
(set-face-background 'vhl/default-face "#aa0")

;; (require 'undohist)
;; (undohist-initialize)

(require 'goto-chg)
(require 'point-undo)
(require 'all-ext)

(require 'search-web)
(defun search-web-dwin (&optional engine word)
  (interactive)
  (let* ((completion-ignore-case t)
         (use-empty-active-region nil)
         (engine (unless engine
                   (completing-read "Search engine (default google): "
                                    (make-search-engine-name-list) nil t
                                    nil nil "google")))
         (word (unless word
                 (if (use-region-p)
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   (or (thing-at-point 'symbol t)
                       (read-string "Search word: "))))))
    (search-web engine word)))
(when (eq system-type 'darwin)
  (add-to-list 'search-engines '("dict" . "dict:///%s")))
