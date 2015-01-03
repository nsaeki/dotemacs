;; Restore frame size
;; Source: http://d.hatena.ne.jp/Tan90909090/20121124/1353757368
;; Edit and snip some comment
(when (display-graphic-p)
  (defconst my-save-frame-file "~/.emacs.d/.framesize")

  (defun my-save-frame-size()
    "Save current frame position and size into `my-save-frame-file'"
    (interactive)
    (let* ((param (frame-parameters (selected-frame)))
           (current-height (frame-height))
           (current-width (frame-width))
           (current-top-margin (if (listp (assoc-default 'top param))
                                   (car (cdr (assoc-default 'top param)))
                                 (assoc-default 'top param)))
           (current-left-margin (if (listp (assoc-default 'left param))
                                    (car (cdr (assoc-default 'left param)))
                                  (assoc-default 'left param)))
           (buf nil)
           (file my-save-frame-file))
      (unless (setq buf (get-file-buffer (expand-file-name file)))
        (setq buf (find-file-noselect (expand-file-name file))))
      (set-buffer buf)
      (erase-buffer)
      (insert
       (concat
        "(set-frame-size (selected-frame) "
        (int-to-string current-width)" "(int-to-string current-height)")\n"
        "(set-frame-position (selected-frame) "
        (int-to-string current-left-margin)" "(int-to-string current-top-margin)")\n"))
      (save-buffer)))

  (defun my-load-frame-size()
    "Restore frame position and size from `my-save-frame-file'"
    (interactive)
    (let ((file my-save-frame-file))
      (when (file-exists-p file)
        (load-file file))))

  (add-hook 'emacs-startup-hook 'my-load-frame-size)
  (add-hook 'kill-emacs-hook 'my-save-frame-size)
  (run-with-idle-timer 60 t 'my-save-frame-size))
