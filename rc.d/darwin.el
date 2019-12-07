(when (eq system-type 'darwin)
  (when (display-graphic-p)
    ;; (mac-auto-ascii-mode 1)

    ;; disable M-h to hide window and so on.
    (setq mac-pass-command-to-system nil)

    ;; Command-Key and Option-Key
    (setq ns-command-modifier (quote meta))
    (setq ns-alternate-modifier (quote super))
    (setq ns-pop-up-frames nil)

    ;; drag and drop
    (define-key global-map [ns-drag-file] 'ns-find-file)

    ;; font
    ;; Ref. http://extra-vision.blogspot.jp/2016/07/emacs.html
    (when (>= emacs-major-version 23)
      (create-fontset-from-ascii-font
       "Menlo"
       nil
       "Menlo_Hiragino")

      (add-to-list 'default-frame-alist '(font . "fontset-Menlo_Hiragino"))

      (set-fontset-font
       "fontset-Menlo_Hiragino"
       ;; 'unicode
       'japanese-jisx0213.2004-1
       (font-spec :family "Hiragino Sans W3" :size 12)
       nil
       'append))))
