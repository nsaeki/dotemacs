(ensure-package-installed 'gtags 'helm-gtags)
(require 'gtags)

(setq c-mode-hook '(lambda () (gtags-mode 1)))
(setq c++-mode-hook '(lambda () (gtags-mode 1)))
(setq php-mode-hook '(lambda () (gtags-mode 1)))
(setq java-mode-hook '(lambda () (gtags-mode 1)))

(setq gtags-select-buffer-single)
(global-set-key "\C-cgt" 'gtags-find-tag)
(global-set-key "\C-cgr" 'gtags-find-rtag)
(global-set-key "\C-cgs" 'gtags-find-symbol)
(global-set-key "\C-cgp" 'gtags-find-pattern)
(global-set-key "\C-cgf" 'gtags-find-file)
(global-set-key "\C-cgb" 'gtags-pop-stack)

(require 'helm-gtags)
;; http://emacs.g.hatena.ne.jp/k1LoW/20090204/1233759384
(defun helm-etags-and-gtags-select ()
  "Tag jump using etags, gtags and `helm'."
  (interactive)
  (let* ((initial-pattern (regexp-quote (or (thing-at-point 'symbol) ""))))
    (helm (list helm-c-source-gtags-select
                    helm-c-source-etags-select)
              initial-pattern)
    "Find Tag: " nil))

(defvar helm-etags-and-gtags-related-select nil)

(defadvice ring-insert (after ring-insert-after activate)
  (setq helm-etags-and-gtags-related-select "etags"))

(defadvice gtags-push-context (after gtags-push-context-after activate)
  (setq helm-etags-and-gtags-related-select "gtags"))

(defun helm-etags-and-gtags-pop-stack ()
  (interactive)
  (if (equal helm-etags-and-gtags-related-select "etags")
      (pop-tag-mark)
    (gtags-pop-stack)))

(define-key gtags-mode-map "\M-*" 'helm-etags-and-gtags-pop-stack)
(define-key gtags-mode-map "\M-." 'helm-etags-and-gtags-select)
