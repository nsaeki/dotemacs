;; Custom Keybindings
(global-set-key (kbd "<M-return>") 'indent-new-comment-line)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "C-|") 'other-window-or-split)

(global-set-key (kbd "M-j") 'ace-jump-mode)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(global-set-key (kbd "M-g .") 'projectile-helm-ag)
(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)

(global-set-key (kbd "C-M-m") 'bm-toggle)
(global-set-key (kbd "M-]") 'bm-next)
(global-set-key (kbd "M-[") 'bm-previous)

(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-'") 'helm-ls-git-ls)
(global-set-key (kbd "C-.") 'helm-imenu)
(global-set-key (kbd "C-M-z") 'helm-resume)
(global-set-key (kbd "C-,") 'helm-bm)
(global-set-key (kbd "C-z") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-o") 'helm-occur)
(global-set-key (kbd "M-.") 'helm-etags-select)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "<C-M-return>") 'mc/edit-lines)
(global-set-key (kbd "C-c h") 'mc/mark-all-like-this)

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-S-=") 'er/contract-region)

(global-set-key (kbd "C-x j") 'open-junk-file)
(global-set-key (kbd "C-x n") 'my-org-open-note)

(global-set-key (kbd "C-c b") 'smart-compile)
(global-set-key (kbd "C-c c") 'my-org-quick-capture)
(global-set-key (kbd "C-c d") 'dash-at-point)
(global-set-key (kbd "C-c e") 'dash-at-point-with-docset)
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
(global-set-key (kbd "C-c q") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c w") 'anzu-query-replace-at-cursor-thing)
(global-set-key (kbd "C-c r") 'my-vcs-revert-hunk)
(global-set-key (kbd "C-c s") 'git-gutter:stage-hunk)
(global-set-key (kbd "C-c =") 'my-vcs-popup-hunk)

;; smartprep
(smartrep-define-key
    global-map "C-c" '(("u" . 'undo-tree-undo)
                       ("U" . 'undo-tree-redo)
                       ("k" . 'point-undo)
                       ("j" . 'point-redo)
                       ("n" . 'my-vcs-next-hunk)
                       ("p" . 'my-vcs-previous-hunk)
                       ("]" . 'goto-last-change-reverse)
                       ("[" . 'goto-last-change)
                       ("C-g" . 'smartrep-quit)))

;; key-chord
(key-chord-define-global "jk" 'view-mode)
(key-chord-define-global "vc" 'magit-status)

;; region-bindings
(define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
(define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
(define-key region-bindings-mode-map "m" 'mc/mark-more-like-this-extended)
(define-key region-bindings-mode-map "h" 'mc/mark-all-like-this)
