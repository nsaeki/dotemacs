;; Changes view-mode when opens file with C-x C-r
(setq view-read-only t)

(require 'view)
;; like less
(define-key view-mode-map (kbd "N") 'View-search-last-regexp-backward)
(define-key view-mode-map (kbd "?") 'View-search-regexp-backward)
;;(define-key view-mode-map (kbd "G") 'View-goto-line-last)
(define-key view-mode-map (kbd "G") 'View-goto-percent)
(define-key view-mode-map (kbd "b") 'View-scroll-page-backward)
(define-key view-mode-map (kbd "f") 'View-scroll-page-forward)
;; like vi
(define-key view-mode-map (kbd "h") 'backward-char)
(define-key view-mode-map (kbd "j") 'next-line)
(define-key view-mode-map (kbd "k") 'previous-line)
(define-key view-mode-map (kbd "l") 'forward-char)
(define-key view-mode-map (kbd "J") 'View-scroll-line-forward)
(define-key view-mode-map (kbd "K") 'View-scroll-line-backward)
;; bm.el
(define-key view-mode-map (kbd "m") 'bm-toggle)
(define-key view-mode-map (kbd "[") 'bm-previous)
(define-key view-mode-map (kbd "]") 'bm-next)

;; (install-elisp-from-emacswiki "viewer.el")
(require 'viewer)

;; Force view-mode if file is read-only
(viewer-stay-in-setup)

;; change mode line color
(setq viewer-modeline-color-unwritable "dark slate blue")
(setq viewer-modeline-color-view "tomato")
;(setq viewer-modeline-color-default "#A5BAF1")
(viewer-change-modeline-color-setup)

(setq view-mode-by-default-regexp "[_.]log$")
;(viewer-aggressive-setup t)

;; doesn't need any more...
;(require 'view-support)

;; http://d.hatena.ne.jp/znz/20081226/emacs
;(static-when (functionp 'hl-line-mode)
  (add-hook 'view-mode-hook '(lambda ()
                               (hl-line-mode 1)
                               (setq cursor-color "gray")))
  (defadvice view-mode-disable (after disable-hl-line-mode activate)
    (hl-line-mode -1)
    (setq cursor-color "#5A647E"))
;)