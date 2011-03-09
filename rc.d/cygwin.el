;; PATH
;(setq exec-path (cons "c:/cygwin/bin" exec-path))
;(setenv "PATH" (concat '"c:/cygwin/bin:" (getenv "PATH")))
;(setq exec-path (cons "c:/cygwin/usr/bin" exec-path))
;(setenv "PATH" (concat '"c:/cygwin/usr/bin:" (getenv "PATH")))
;(setq exec-path (cons "c:/cygwin/usr/local/bin" exec-path))
;(setenv "PATH" (concat '"c:/cygwin/usr/local/bin:" (getenv "PATH")))

;; cygwin
(require 'cygwin-mount)

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

(cygwin-mount-activate)
