(require 'gtags)

(setq c-mode-hook '(lambda () (gtags-mode 1)))
(setq c++-mode-hook '(lambda () (gtags-mode 1)))
(setq php-mode-hook '(lambda () (gtags-mode 1)))
(setq java-mode-hook '(lambda () (gtags-mode 1)))

(require 'anything-gtags)
;; http://emacs.g.hatena.ne.jp/k1LoW/20090204/1233759384
(defun anything-etags-and-gtags-select ()
  "Tag jump using etags, gtags and `anything'."
  (interactive)
  (let* ((initial-pattern (regexp-quote (or (thing-at-point 'symbol) ""))))
    (anything (list anything-c-source-gtags-select
                    anything-c-source-etags-select)
              initial-pattern)
    "Find Tag: " nil))

(defvar anything-etags-and-gtags-related-select nil)

(defadvice ring-insert (after ring-insert-after activate)
  (setq anything-etags-and-gtags-related-select "etags"))

(defadvice gtags-push-context (after gtags-push-context-after activate)
  (setq anything-etags-and-gtags-related-select "gtags"))

(defun anything-etags-and-gtags-pop-stack ()
  (interactive)
  (if (equal anything-etags-and-gtags-related-select "etags")
      (pop-tag-mark)
    (gtags-pop-stack)))

(define-key gtags-mode-map "\M-*" 'anything-etags-and-gtags-pop-stack)
(define-key gtags-mode-map "\M-." 'anything-etags-and-gtags-select)
