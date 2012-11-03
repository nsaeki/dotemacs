;; insert date
(defun my-get-datetime (fmt) (insert (format-time-string fmt)))
(defun date () (interactive) (my-get-datetime "[%Y-%m-%d]"))
(defun time () (interactive) (my-get-datetime "[%H:%M:%S]"))
(defun dtime () (interactive) (my-get-datetime "[%Y-%m-%d %H:%M:%S]"))

;; save script file as executable
(defun make-file-executable ()
  "Make the file of this buffer executable, when it is a script source."
  (save-restriction
    (widen)
    (if (string= "#!" (buffer-substring-no-properties 1 (min 3 (point-max))))
	(let ((name (buffer-file-name)))
	  (or (equal ?. (string-to-char (file-name-nondirectory name)))
	      (let ((mode (file-modes name)))
		(set-file-modes name (logior mode (logand (/ mode 4) 73)))
		(message (concat "Wrote " name " (+x)"))))))))
(add-hook 'after-save-hook 'make-file-executable)

;; go to the matching paren if on a paren
(global-set-key "\C-x%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))))

;; toggle truncate lines
;; http://ubulog.blogspot.com/2007/09/emacsonoff.html
(defun toggle-truncate-lines ()
  "toggle trancate lines"
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-cl" 'toggle-truncate-lines)
(setq-default truncate-partial-width-windows nil)

(defun split-window-conditional ()
  (interactive)
  (if (> (* (window-height) 2) (window-width))
      (split-window-vertically)
    (split-window-horizontally)))
;;(define-key windmove-map "s" 'split-window-conditional)

(defun other-window-or-split ()
  (interactive)
;;  (when (one-window-p) (split-window-horizontally))
;;  (when (one-window-p) (split-window-vertically))
  (when (one-window-p) (split-window-conditional))
  (other-window 1))
(global-set-key (kbd "C-,") 'other-window-or-split)

;; preserve scratch buffer
;; http://www-tsujii.is.s.u-tokyo.ac.jp/~yoshinag/tips/elisp_tips.html#scratch
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when (and initial-scratch-message (not inhibit-startup-message))
      (insert initial-scratch-message))
    (or arg (progn (setq arg 0)
                   (switch-to-buffer "*scratch*")))
    (cond ((= arg 0) (message "*scratch* is cleared up."))
          ((= arg 1) (message "another *scratch* is created")))))
;; just clear when killing *scratch* buffer
(add-hook 'kill-buffer-query-functions
          (lambda ()
            (if (string= "*scratch*" (buffer-name))
                (progn (my-make-scratch 0) nil)
              t)))