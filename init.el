(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat "~/.emacs.d/" path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "site-lisp")

;; init scripts
;; (setq rc-directory "~/.emacs.d/rc.d/")
;; (add-to-list 'load-path rc-directory)
;; (dolist (file (directory-files rc-directory t "^[0-9]+\.*\\.el$"))
;;   (load file))

(package-initialize)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/.emacs.d/rc.d/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(anzu-use-migemo t)
 '(helm-buffer-max-length 35)
 '(helm-delete-minibuffer-contents-from-point t)
 '(helm-ff-skip-boring-files t)
 '(helm-ff-transformer-show-only-basename nil)
 '(helm-ls-git-show-abs-or-relative (quote relative))
 '(helm-mini-default-sources
   (quote
    (helm-source-buffers-list helm-source-recentf helm-source-files-in-current-dir helm-source-ghq)))
 '(helm-truncate-lines t t)
 '(minitest-keymap-prefix (kbd "C-c ."))
 '(package-selected-packages
   (quote
    (scala-mode2 wgrep-ag shell-pop search-web rust-mode ruby-test-mode rubocop rspec-mode region-bindings-mode recentf-ext rbenv rainbow-mode quickrun powershell popwin php-mode ox-gfm open-junk-file neotree multiple-cursors minitest markdown-mode magit less-css-mode key-chord json-mode init-loader inf-ruby highlight-symbol helm-projectile helm-migemo helm-ls-git helm-ghq helm-descbinds helm-c-yasnippet helm-bm helm-ag header2 gotest golint go-errcheck go-eldoc go-direx go-autocomplete git-gutter-fringe gist flycheck expand-region evil dockerfile-mode diff-hl dash-at-point color-moccur coffee-mode avy auto-save-buffers-enhanced auto-highlight-symbol anzu all-ext alchemist ag)))
 '(rst-level-face-base-light 50))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-face ((t (:background "#595900"))))
 '(diff-hl-change ((t (:foreground "pink4" :background "#58444a"))))
 '(git-gutter:added ((t (:foreground "SeaGreen4"))))
 '(git-gutter:deleted ((t (:foreground "red4"))))
 '(git-gutter:modified ((t (:foreground "plum4"))))
 '(rst-level-1-face ((t (:foreground "LightSkyBlue"))) t)
 '(rst-level-2-face ((t (:foreground "LightGoldenrod"))) t)
 '(rst-level-3-face ((t (:foreground "Cyan1"))) t)
 '(rst-level-4-face ((t (:foreground "chocolate1"))) t)
 '(rst-level-5-face ((t (:foreground "PaleGreen"))) t)
 '(rst-level-6-face ((t (:foreground "Aquamarine"))) t))
