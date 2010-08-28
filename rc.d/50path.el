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
