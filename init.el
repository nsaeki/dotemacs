(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat "~/.emacs.d/" path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "site-lisp")

;; init scripts
;; (setq rc-directory "~/.emacs.d/rc.d/")
;; (add-to-list 'load-path rc-directory)
;; (dolist (file (directory-files rc-directory t "^[0-9]+\.*\\.el$"))
;;   (load file))

(package-initialize)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/.emacs.d/rc.d/")
