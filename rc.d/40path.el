;; PATH
;(setq exec-path (cons "/usr/local/bin" exec-path))
;(setenv "PATH" (concat '"/usr/local/bin:" (getenv "PATH")))

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell
         (replace-regexp-in-string "[[:space:]\n]*$" ""
           (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))
))
(when (equal system-type 'darwin) (set-exec-path-from-shell-PATH))

;; ;; gem path
;; ;; [ -x `which gem` ]
;; ;; && PATH="`gem env | perl -ne 'print $1 if /EXECUTABLE DIRECTORY: (.+)$/'`":$PATH

;; (let ((gempath
;;        (replace-regexp-in-string ".*EXECUTABLE DIRECTORY:\\s-*\\([^\s\n]+\\)[\s\n]*$" "\\1"
;;          (shell-command-to-string "gem env | grep 'EXECUTABLE DIRECTORY'"))))
;;       (setenv "PATH" (concat gempath ":" (getenv "PATH")))
;;       (setq exec-path (cons gempath exec-path)))
