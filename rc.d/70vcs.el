;; magit
;; (require 'magit)

;; git-gutter-fringe
(require 'git-gutter-fringe)
;; (global-git-gutter-mode t)
(custom-set-faces
 '(git-gutter:modified ((t (:foreground "plum4"))))
 '(git-gutter:added ((t (:foreground "SeaGreen4"))))
 '(git-gutter:deleted ((t (:foreground "red4")))))

;; small and a little left
(fringe-helper-define 'git-gutter-fr:added nil
  "........"
  "..XX...."
  "..XX...."
  "XXXXXX.."
  "XXXXXX.."
  "..XX...."
  "..XX...."
  "........")

(fringe-helper-define 'git-gutter-fr:deleted nil
  "........"
  "........"
  "........"
  "XXXXXX.."
  "XXXXXX.."
  "........"
  "........"
  "........")

(fringe-helper-define 'git-gutter-fr:modified nil
  "........"
  ".XXX...."
  ".XXX...."
  ".XXX...."
  ".XXX...."
  ".XXX...."
  ".XXX...."
  "........")

;; diff-hl
(global-diff-hl-mode t)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)
(setq diff-hl-draw-borders nil)
(diff-hl-margin-mode)
(setq diff-hl-margin-side 'right)
(custom-set-faces
 '(diff-hl-change
   ((t (:foreground "pink4" :background "#58444a")))))

;; Switch main component to use
;; (defalias 'my-vcs-next-hunk 'git-gutter:next-hunk)
;; (defalias 'my-vcs-previous-hunk 'git-gutter:previous-hunk)

(defalias 'my-vcs-next-hunk 'diff-hl-next-hunk)
(defalias 'my-vcs-previous-hunk 'diff-hl-previous-hunk)
