;; Custom Keybindings
(when (display-graphic-p)
  ;; (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z") 'helm-find-files))

(global-set-key (kbd "<M-return>") 'indent-new-comment-line)
(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-tab>") 'previous-buffer)
(global-set-key (kbd "C-|") 'other-window-or-split)

;; (global-set-key (kbd "M-?") 'help-command)
;; (keyboard-translate ?\C-h ?\C-?)

(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x j") 'open-junk-file)

(global-set-key (kbd "M-j") 'ace-jump-mode)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(global-set-key (kbd "M-g .") 'my-projectile-helm-ag)
(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)

(global-set-key (kbd "C-M-m") 'bm-toggle)
(global-set-key (kbd "M-]") 'bm-next)
(global-set-key (kbd "M-[") 'bm-previous)

(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-:") 'helm-bm)
(global-set-key (kbd "C-'") 'helm-ls-git-ls)
(global-set-key (kbd "C-.") 'helm-imenu)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-o") 'helm-occur)
(global-set-key (kbd "M-.") 'helm-etags-select)
(global-set-key (kbd "C-M-z") 'helm-resume)
(global-set-key (kbd "C-M-;") 'my-helm-for-project)

(global-set-key (kbd "C-=") 'er/expand-region)
;; Instead of this, simply press "-" after 'er/expand-region
;; (global-set-key (kbd "C-+") 'er/contract-region)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)
(global-set-key (kbd "<C-M-return>") 'mc/edit-lines)

(global-set-key (kbd "C-c c") 'smart-compile)
(global-set-key (kbd "C-c d") 'dash-at-point)
(global-set-key (kbd "C-c D") 'dash-at-point-with-docset)
(global-set-key (kbd "C-c r") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c h") 'my-swap-buffer)
(global-set-key (kbd "C-c i") 'delete-indentation)
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-c m") 'my-org-open-note)
;; (global-set-key (kbd "C-c m") 'my-org-quick-capture)
(global-set-key (kbd "C-c q") 'quickrun)
(global-set-key (kbd "C-c w") 'quickrun-with-arg)
(global-set-key (kbd "C-c o") 'browse-url)
(global-set-key (kbd "C-c s") 'search-web-dwin)
;; (global-set-key (kbd "C-c g")
;;                 (lambda () (interactive) (search-web-dwin "google")))

(global-set-key (kbd "C-x v p") 'projectile-dired)
;; (global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
;; (global-set-key (kbd "C-x v n") 'git-gutter:revert-hunk)
;; (global-set-key (kbd "C-x v j") 'git-gutter:stage-hunk)
;; smartrep
(smartrep-define-key
    global-map "C-c" '(("u" . 'goto-last-change)
                       ("U" . 'goto-last-change-reverse)
                       ("i" . 'delete-indentation)
                       ("k" . 'point-undo)
                       ("j" . 'point-redo)))

(smartrep-define-key
    global-map "C-x" '(("n" . 'my-vcs-next-hunk)
                       ("p" . 'my-vcs-previous-hunk)))

;; key-chord
(key-chord-define-global "jk" 'view-mode)
(key-chord-define-global "vc" 'magit-status)

;; region-bindings
(define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
(define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
(define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
;; (define-key region-bindings-mode-map "," 'er/expand-region)
;; (define-key region-bindings-mode-map "." 'er/contract-region)
