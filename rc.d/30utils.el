(ensure-package-installed 'shell-command)
(require 'shell-command)
(shell-command-completion-mode)

(ensure-package-installed 'open-junk-file)
(require 'open-junk-file)
(setq open-junk-file-format "~/sandbox/%Y%m%d%H%M%S.")
(global-set-key (kbd "C-c k") 'open-junk-file)

;; camelCase-mode
;; http://www.eecs.ucf.edu/~leavens/emacs/camelCase/camelCase-mode.el
;; Emacs 23 has `capitalized-words-mode', but it doesn't work correctly.
(autoload 'camelCase-mode "camelCase-mode" nil t)

;; ThingAtPoint
(require 'thingatpt)

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

;; midnight mode for clean-buffer-list
(require 'midnight)

;; marked
;; http://support.markedapp.com/kb/how-to-tips-and-tricks/marked-bonus-pack-scripts-commands-and-bundles
(defun marked ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a 'Marked 2' %s"
       (shell-quote-argument (buffer-file-name)))))
