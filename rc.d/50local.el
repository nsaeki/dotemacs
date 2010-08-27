;; frame size
(setq initial-frame-alist
      (append (list
	       ;; '(width . 84)
	       ;; '(height . 42)
	       '(width . 168)
	       '(height . 46)
	       )
	      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)
(split-window-horizontally)

;; PATH
(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH" (concat '"/usr/local/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/git/bin" exec-path))
(setenv "PATH" (concat '"/usr/local/git/bin:" (getenv "PATH")))

;; perlbrew
(setq exec-path (cons "~/perl5/perlbrew/bin" exec-path))
(setenv "PATH" (concat '"~/perl5/perlbrew/bin:" (getenv "PATH")))

;; rvm
;; (install-elisp "http://github.com/senny/rvm.el/raw/master/rvm.el")
(setq exec-path (cons "~/.rvm/rubies/default/bin" exec-path))
(setenv "PATH" (concat '"~/.rvm/rubies/default/bin:" (getenv "PATH")))

;; switchs by system
(cond ((eq system-type 'darwin) (load "darwin" t))
      ((eq system-type 'windows-nt) (load "cygwin" t)))
