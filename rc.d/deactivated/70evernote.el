;; http://d.hatena.ne.jp/a_bicky/20120226/1330265529
(when (require 'evernote-mode nil t)
  ;;(setq evernote-ruby-command "/Users/arabiki/.rbenv/shims/ruby")
  ;; (if (require 'w3m-load nil t)
  ;;     (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))) ; optional
  (define-prefix-command 'evernote-map)
  (global-set-key "\C-ce" 'evernote-map)
  (global-set-key "\C-cec" 'evernote-create-note)
  (global-set-key "\C-ceo" 'evernote-open-note)
  (global-set-key "\C-ces" 'evernote-search-notes)
  (global-set-key "\C-ceS" 'evernote-do-saved-search)
  (global-set-key "\C-cew" 'evernote-write-note)
  (global-set-key "\C-cep" 'evernote-post-region)
  (global-set-key "\C-ceb" 'evernote-browser)
  (setq evernote-username "nsaeki")
  ;;(define-key evernote-mode-map (kbd "C-c t") 'evernote-toggle-read-only) ; default is C-x C-q
  ;;(define-key evernote-mode-map (kbd "C-c p") 'evernote-insert-pre)  ; pre タグを手軽に挿入したい
  ;;(setq evernote-pre-style "padding: 8px; color: #ffffff; background: #333333;")
  ;; (defun evernote-insert-pre()
  ;;   (interactive)
  ;;   (insert "<pre style=\"" evernote-pre-style "\"></pre>")
  ;;   (search-backward "</" nil t))
)
