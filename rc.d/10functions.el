;; insert date
(defun my-get-datetime (fmt) (insert (format-time-string fmt)))
(defun date () (interactive) (my-get-datetime "%Y-%m-%d"))
(defun time () (interactive) (my-get-datetime "%H:%M:%S"))
(defun datetime () (interactive) (my-get-datetime "%Y-%m-%d %H:%M:%S"))

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

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p) (split-window-sensibly))
  (other-window 1))

(defun my-swap-buffer (arg)
  "Swap buffers with next window"
  (interactive "p")
  (let* ((current (selected-window))
         ;; Zero means this does not select minibuffer even if it's active
         (other (next-window current 0))
         (current-buf (window-buffer current)))
    (unless (or (eq current other)
                (window-minibuffer-p current))
      (set-window-buffer (selected-window) (window-buffer other))
      (set-window-buffer other current-buf)
      (if (= arg 1) (select-window other)))))

;; preserve scratch buffer
;; http://www-tsujii.is.s.u-tokyo.ac.jp/~yoshinag/tips/elisp_tips.html#scratch
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when initial-scratch-message
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

(defun my-vc-rootdir ()
  "Return VCS root directory of current buffer file.
If the buffer is not in VCS, return nil"
  (interactive)
  (let ((backend (vc-deduce-backend)))
    (when backend
      (vc-call-backend backend 'root default-directory))))

(defun my-dired-jump-to-project-root ()
  "Open VCS root directory in dired mode if current buffer is in VCS.
Otherwise open current directory"
  nil
  (interactive)
  (let ((rootdir (my-vc-rootdir)))
    (if (and rootdir (file-directory-p rootdir))
        (dired-jump nil rootdir)
      (dired-jump))))

;; http://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

;; http://rubikitch.com/2015/05/14/global-hl-line-mode-timer/
(require 'hl-line)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
    (global-hl-line-highlight)))
(setq global-hl-line-timer
      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))
;; (cancel-timer global-hl-line-timer)

(defun my/open-blog-file ()
  (interactive)
  (let ((filename (format-time-string "%Y%m%d")))
    (find-file (concat "~/notes/blog/" filename ".md"))
    (goto-char (point-max))))
