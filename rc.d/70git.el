;; (require 'magit)

;; git-gutter-fringe
;; (require 'git-gutter-fringe)
;; (global-git-gutter-mode t)
(set-face-foreground 'git-gutter:modified "plum4")
(set-face-foreground 'git-gutter:added "seagreen4")
(set-face-foreground 'git-gutter:deleted "red4")

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
  "........") ;;

;; diff-hl
(setq diff-hl-draw-borders nil)
