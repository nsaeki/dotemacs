;; Initial Frame size
(setq initial-frame-alist
      (append '((top . 32)
                (left . 630)
                (width . 110)
                (height . 60))
              initial-frame-alist))
(setq default-frame-alist initial-frame-alist)
(split-window-horizontally)

;; Transparency
(if window-system
    (progn (set-frame-parameter nil 'alpha 100)))

;; http proxy
(setq url-proxy-services '(("http" . "proxy.host:8080")))
