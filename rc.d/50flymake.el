(require 'flymake)
(set-face-background 'flymake-errline "pink1")
(set-face-background 'flymake-warnline "dark slate blue")

;; http://d.hatena.ne.jp/xcezx/20080314/1205475020
(defun flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no (flymake-current-line-no))
         (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
        (let* ((file (flymake-ler-file
                      (nth (1- count) line-err-info-list)))
               (full-file (flymake-ler-full-file
                           (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text
                      (nth (1- count) line-err-info-list)))
               (line (flymake-ler-line
                      (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)))
      (setq count (1- count)))))

;; http://tech.lampetty.net/tech/index.php/archives/380
(defun flymake-display-next-error ()
  (interactive)
  (flymake-goto-next-error)
  (let ((err (get-char-property (point) 'help-echo)))
    (when err
      (message err))))

(defun flymake-display-prev-error ()
  (interactive)
  (flymake-goto-prev-error)
  (let ((err (get-char-property (point) 'help-echo)))
    (when err
      (message err))))

;;(global-set-key "\C-c\C-d" 'flymake-display-err-minibuf)
(global-set-key "\C-ce" 'flymake-display-err-minibuf)
(global-set-key "\C-cn" 'flymake-display-next-error)
(global-set-key "\C-cp" 'flymake-display-prev-error)

