;; (setenv "GOPATH" (envcache/getenv "GOPATH"))

(add-hook 'go-mode-hook #'lsp)
(add-hook 'go-mode-hook 'flycheck-mode)

(eval-after-load 'go-mode
  '(progn
     (define-key go-mode-map (kbd "C-c ,") 'go-test-mode-map)
     (define-key go-mode-map (kbd "C-c C-r") 'go-remove-unused-imports)
     (define-key go-mode-map (kbd "C-c C-l") 'golint)))

;; gotest
(define-prefix-command 'go-test-mode-map)
(define-key go-test-mode-map (kbd "s") 'go-test-current-test)
(define-key go-test-mode-map (kbd "f") 'go-test-current-file)
(define-key go-test-mode-map (kbd "a") 'go-test-current-project)
(define-key go-test-mode-map (kbd "c") 'go-test-current-coverage)
(define-key go-test-mode-map (kbd "x") 'go-run)

;; (require 'go-autocomplete)
;; (require 'auto-complete-config)

;; go-eldoc
;; (add-hook 'go-mode-hook 'go-eldoc-setup)

;; golint
(require 'golint)
;; (push '("^\*golint*" :regexp t :dedicated t) popwin:special-display-config)

;; helm-go-package
(eval-after-load 'go-mode
  '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

;; http://syohex.hatenablog.com/entry/20130618/1371567527
(defvar my/helm-go-source
  '((name . "Helm Go")
    (candidates . go-packages)
    (action . (("Show document" . godoc)
               ("Import package" . my/helm-go-import-add)))))

(defun my/helm-go-import-add (candidate)
  (dolist (package (helm-marked-candidates))
    (go-import-add current-prefix-arg package)))

(defun my/helm-godoc ()
  (Interactive)
  (helm :sources '(my/helm-go-source) :buffer "*helm godoc*"
        :buffer "*helm godoc*"))
