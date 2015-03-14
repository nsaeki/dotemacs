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
                ;; If region is activated but empty, ignore that.
                ((use-region-p)
                 (buffer-substring-no-properties (region-beginning) (region-end)))
                ((thing-at-point 'symbol t))
                ;; Prompt to input search word if word is empty.
                (t (read-string "Search Word: " nil 'search-web-word-history)))))
    (search-web engine word)))
(when (eq system-type 'darwin)
  (add-to-list 'search-web-engines '("dict" "dict:///%s" nil)))
