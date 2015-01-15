(when (display-graphic-p)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory "~/.emacs.d/themes/"))
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory "~/.emacs.d/themes/idlefingers-emacs/"))
  (load-theme 'idlefingers t)

  ;; some customizations
  (custom-set-faces
   '(linum ((t (:inherit (shadow default) :foreground "dim gray" :background "#333"))))
   '(mode-line ((t (:background "cornsilk4" :foreground "#000000"))))
   '(default ((t (:foreground "#d9d9d9"))))
   '(font-lock-comment-face ((t (:italic t :foreground "#6e6e6e"))))
   '(show-paren-match-face ((t (:foreground "#1B1D1E" :background "#FD971F"))))
   '(paren-face ((t (:foreground "#A6E22A" :background nil)))))
  )
