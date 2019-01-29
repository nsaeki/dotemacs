;; direx
(require 'direx)
;; (push '(direx:direx-mode :position left :width 0.3 :dedicated t)
;;       popwin:special-display-config)

(defun my/direx-jump-to-directory-other-window ()
  (interactive)
  (condition-case err
      (direx-project:jump-to-project-root-other-window)
    ('error (direx:jump-to-directory-other-window))))
