;; Custom Keybindings
(when (display-graphic-p)
  (global-unset-key (kbd "C-x C-z"))
  (global-set-key (kbd "C-z") 'shell-pop))

(global-unset-key (kbd "C-h h"))        ; disable 'view-hello-file
(global-set-key (kbd "<M-return>") 'indent-new-comment-line)
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-tab>") 'previous-buffer)
(global-set-key (kbd "C-|") 'other-window-or-split)

;; (global-set-key (kbd "C-h") 'delete-backward-char)
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(global-set-key (kbd "M-?") 'help-command)

(global-set-key (kbd "M-z") 'zop-up-to-char)
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x j") 'open-junk-file)

(global-set-key (kbd "M-j") 'avy-goto-char-timer)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(global-set-key (kbd "M-g .") 'my-projectile-helm-ag)
(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)

(global-set-key (kbd "C-M-m") 'bm-toggle)
(global-set-key (kbd "M-]") 'bm-next)
(global-set-key (kbd "M-[") 'bm-previous)

(global-set-key (kbd "C-c SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c C-SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-.") 'helm-imenu)
(global-set-key (kbd "M-.") 'helm-etags-select)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-o") 'helm-occur)
(global-set-key (kbd "C-M-o") 'helm-multi-occur)
(global-set-key (kbd "C-M-z") 'helm-resume)
(global-set-key (kbd "C-M-;") 'my-helm-for-files-in-project)
(global-set-key (kbd "C-'") 'my-helm-for-projects)

(global-set-key (kbd "C-,") 'er/expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c a") 'mc/mark-all-dwim)

(global-set-key (kbd "C-c c") 'smart-compile)
(global-set-key (kbd "C-c d") 'dash-at-point)
(global-set-key (kbd "C-c j") 'neotree-toggle)
(global-set-key (kbd "C-c C-j") 'neotree-toggle)
;; (global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-c n") 'my/org-open-journal)
(global-set-key (kbd "C-c n") 'my/org-open-journal)
(global-set-key (kbd "C-c N") 'my/org-open-journal-with-title)
(global-set-key (kbd "C-c m") 'bm-toggle)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-c o") 'browse-url)
(global-set-key (kbd "C-c q") 'quickrun)
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c t") 'my-swap-buffer)
(global-set-key (kbd "C-c v") 'browse-url-of-file)
(global-set-key (kbd "C-c y") 'copy-file-name-to-clipboard)
(global-set-key (kbd "C-c f") 'my/search-web-dwim)
(global-set-key (kbd "C-c g") (lambda () (interactive) (my/search-web-dwim "google")))
(global-set-key (kbd "C-c e") (lambda () (interactive) (my/search-web-dwim "dict")))
(global-set-key (kbd "C-c =") 'vc-diff)

(global-set-key (kbd "C-x v p") 'projectile-dired)
;; (global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
;; (global-set-key (kbd "C-x v n") 'git-gutter:revert-hunk)
;; (global-set-key (kbd "C-x v j") 'git-gutter:stage-hunk)

;; smartrep
(smartrep-define-key
    global-map "C-c" '(("u" . 'goto-last-change)
                       ("U" . 'goto-last-change-reverse)
                       ("i" . 'delete-indentation)))

(smartrep-define-key
    global-map "C-x" '(("n" . 'my-vcs-next-hunk)
                       ("p" . 'my-vcs-previous-hunk)))

(smartrep-define-key
    global-map "M-g" '(("n" . 'next-error)
                       ("p" . 'previous-error)))

;; key-chord
;; (key-chord-define-global "jk" 'view-mode)
(key-chord-define-global "jk" 'evil-mode)
(key-chord-define-global "df" 'vc-diff)
(key-chord-define-global "vc" 'magit-status)

;; region-bindings
(define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
(define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
(define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
(define-key region-bindings-mode-map (kbd "<return>") 'mc/edit-lines)
