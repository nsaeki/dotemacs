(when (display-graphic-p)
  ;; Command-Key and Option-Key
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
  (setq ns-pop-up-frames nil)

  ;; drag and drop
  (define-key global-map [ns-drag-file] 'ns-find-file)

  ;; font
  (when (>= emacs-major-version 23)
    ;; (create-fontset-from-ascii-font
    ;;  "-apple-monaco-medium-normal-normal-*-12-*" nil "hirakaku12")
    (create-fontset-from-ascii-font
     "-apple-menlo-medium-normal-normal-*-12-*" nil "hirakaku12")

    (set-frame-font "fontset-hirakaku12")
    (add-to-list 'default-frame-alist '(font . "fontset-hirakaku12"))

    ;; Ricty
    ;;(set-face-attribute 'default nil :family "Ricty" :height 140)
    ;;(set-fontset-font "fontset-default" 'japanese-jisx0208 '("Ricty" . "iso10646-*"))

    (set-fontset-font
     "fontset-hirakaku12"
     'japanese-jisx0208
     "-apple-hiragino_kaku_gothic_pro-medium-normal-normal-*-14-*-iso10646-1")

    (set-fontset-font
     "fontset-hirakaku12"
     'jisx0201
     "-apple-hiragino_kaku_gothic_pro-medium-normal-normal-*-14-*-iso10646-1")

    (set-fontset-font
     "fontset-hirakaku12"
     'japanese-jisx0212
     "-apple-hiragino_kaku_gothic_pro-medium-normal-normal-*-14-*-iso10646-1")

    (set-fontset-font
     "fontset-hirakaku12"
     'katakana-jisx0201
     "-apple-hiragino_kaku_gothic_pro-medium-normal-normal-*-14-*-iso10646-1"))
  )
