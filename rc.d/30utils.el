;; (require 'shell-commandd
(shell-command-completion-mode)

(require 'open-junk-file)
(setq open-junk-file-format "~/sandbox/%Y%m%d%H%M%S.")
(global-set-key (kbd "C-c k") 'open-junk-file)

;; (require 'thingatpt)

(require 'sequential-command-config)
(sequential-command-setup-keys)

(setq recentf-max-saved-items 500)
(setq recentf-exclude '("/TAGS$" "/var/tmp"))
(require 'recentf-ext)

;; (require 'color-moccur)
(setq moccur-split-word t)

;; (install-elisp "http://taiyaki.org/elisp/mell/src/mell.el")
;; (install-elisp "http://taiyaki.org/elisp/text-adjust/src/text-adjust.el")
(require 'text-adjust)

(require 'point-undo)
(define-key global-map (kbd "C-z") 'point-undo)
(define-key global-map (kbd "C-M-z") 'point-redo)

;; dmacro
(defconst *dmacro-key* "\C-t" "repeat key")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)

;; sml-modeline-mode
(sml-modeline-mode t)
(set-face-foreground 'sml-modeline-end-face "#000000")
(set-face-background 'sml-modeline-end-face "#b0b0b0")
(set-face-foreground 'sml-modeline-vis-face "#000000")
(set-face-background 'sml-modeline-vis-face "#80c000")

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

;; (require 'undohist)
;; (undohist-initialize)
