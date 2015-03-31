(when (equal system-type 'darwin)
  (let ((path-from-shell (envcache/getenv "PATH")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
