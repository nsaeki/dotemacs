;; visualize whitespace
;; http://qiita.com/itiut@github/items/4d74da2412a29ef59c3a

;; package: whitespace
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      ;; '((space-mark ?\u3000 [?\u25a1])
      '((space-mark ?\u3000 [?\uff3f])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

(global-whitespace-mode 1)

(defvar my/bg-color "#282828")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "#363636"
                    ;; underline stains modeline (confirmed in Emacs 24.4).
                    ;; :underline t
                    )
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "#484848"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)

;; Color Test
;;      Full width space : あお　ぞら
;;   Trailing whitespace :   
;;                   Tab :	aaa
;;          Trailing Tab :	

;; https://github.com/purcell/whitespace-cleanup-mode
;; package: whitespace-cleanup-mode
;; (global-whitespace-cleanup-mode t)
