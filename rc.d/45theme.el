(when (display-graphic-p)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory "~/.emacs.d/themes/"))
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory "~/.emacs.d/themes/idlefingers-emacs/"))
  (load-theme 'idlefingers t)

  ;; some customizations
  (custom-set-faces
   '(default ((t (:foreground "#d9d9d9"))))
   '(font-lock-comment-face ((t (:italic t :foreground "#6e6e6e"))))
   '(paren-face ((t (:foreground "#A6E22A" :background nil))))
   '(show-paren-match-face ((t (:foreground "#1B1D1E" :background "goldenrod3"))))
   '(linum ((t (:inherit (shadow default) :foreground "dim gray" :background "#333"))))
   '(mode-line ((t (:background "#e3e3e3" :foreground "#000000"))))
   '(sml-modeline-vis-face ((t (:background "#a0e000" :foreground "#000000"))))
   '(sml-modeline-end-face ((t (:background "#9c998a" :foreground "#000000"))))

   '(which-func ((t (:foreground "#809a4d"))))
   '(anzu-mode-line ((t (:foreground "chocolate" :bold t)))))

  ;; change mode-line color by evil state
  (lexical-let ((default-color (cons (face-background 'mode-line)
                                     (face-foreground 'mode-line))))
    (add-hook 'post-command-hook
              (lambda ()
                (let ((color (cond ((minibufferp) default-color)
                                   ((evil-normal-state-p) '("#44789c" . "#000000"))
                                   ((evil-insert-state-p) '("#00bff1" . "#000000"))
                                   ((evil-emacs-state-p)  '("#444488" . "#000000"))
                                   (t default-color))))
                  (set-face-background 'mode-line (car color))
                  (set-face-foreground 'mode-line (cdr color)))))))

;; 調整用
;; (set-face-attribute 'anzu-mode-line nil
;;                     :foreground "chocolate" :weight 'bold)
;; (set-face-foreground 'which-func "dark olive green")
;; (set-face-foreground 'which-func "#a0e000")
;; (set-face-foreground 'sml-modeline-end-face "#000000")
;; (set-face-background 'sml-modeline-end-face "#9c998a")
;; (set-face-foreground 'sml-modeline-vis-face "#000000")
;; (set-face-background 'sml-modeline-vis-face "#a0e000")
;; (set-face-background 'show-paren-match-face "#FD971F")
;; (set-face-background 'show-paren-match-face "goldenrod3")
;; (set-face-background 'show-paren-match-face "LightSkyBlue4")
