;; frame size
(setq initial-frame-alist
      (append '((top . 42)
                (left . 45)
                ;; (width . 84)
                ;; (height . 42)
                (width . 168)
                (height . 46))
	      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)
(split-window-horizontally)

;(when (eq window-system 'mac)
;  (add-hook 'window-setup-hook
;            (lambda ()
;              (set-frame-parameter nil 'fullscreen 'fullboth)
;              )))

;(if window-system (progn
;   (set-frame-parameter nil 'alpha 100)
;   ))

;; http proxy
;; (setq url-proxy-services '(("http" . "proxy.host:8080")))

(setq org-directory "~/notes/")
(setq open-junk-file-format "~/work/sandbox/%Y-%m-%d-%H%M%S.")
