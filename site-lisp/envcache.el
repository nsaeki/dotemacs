(defvar envcache/env '())

(defun envcache/init ()
  nil
  (setq envcache/env '())
  (dolist (elem (split-string (shell-command-to-string "env") "\n"))
    (let ((pair (split-string elem "=")))
      (if (> (length pair) 1)
          (add-to-list 'envcache/env pair)))))
(envcache/init)

(defun envcache/getenv (key)
  nil
  (car (assoc-default key envcache/env)))
(envcache/getenv "GOPATH")

(provide 'envcache)
