;; copied from bm.el
(setq bm-repository-file "~/.emacs.d/bm-repository")
(setq bm-restore-repository-on-load t)
;; (setq-default bm-buffer-persistence t)

;; (add-hook 'after-init-hook 'bm-repository-load)
;; (add-hook 'find-file-hooks 'bm-buffer-restore)
;; (add-hook 'after-revert-hook 'bm-buffer-restore)
;; (add-hook 'after-save-hook 'bm-buffer-save)
;; (add-hook 'vc-before-checkin-hook 'bm-buffer-save)
;; (add-hook 'kill-buffer-hook 'bm-buffer-save)
;; (add-hook 'kill-emacs-hook '(lambda nil
;;                               ;; Sometimes error happens on quitting emacs.
;;                               ;; bm-buffer-save: Wrong type argument: listp, \.\.\.
;;                               ;; (bm-buffer-save-all)
;;                               (bm-repository-save)))

(setq bm-persistent-face 'bm-face)
(custom-set-faces
 '(bm-face ((t (:background "#595900")))))

(require 'bm)
