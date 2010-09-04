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

;; http proxy
;; (setq url-proxy-services '(("http" . "proxy.host:8080")))

;; for auto-install
(setq update-emacswiki-package-name-at-launch nil)

(setq open-junk-file-format "~/work/sandbox/%Y-%m-%d-%H%M%S.")

(setq anything-for-files-prefered-list
      '(anything-c-source-ffap-line
	anything-c-source-ffap-guesser
	anything-c-source-buffers+
	anything-c-source-recentf
	anything-c-source-bookmarks
	anything-c-source-file-cache
	anything-c-source-files-in-current-dir+
	;; for linux
	;; anything-c-source-locate
	;; for mac
	;; anything-c-source-mac-spotlight
	)
)
