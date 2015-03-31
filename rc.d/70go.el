(setenv "GOPATH" (envcache/getenv "GOPATH"))

;; use latest go-mode installed from MELPA
;; go get code.google.com/p/rog-go/exp/cmd/godef
(require 'go-mode-autoloads)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") #'godef-jump)
                          (local-set-key (kbd "C-c ,") 'go-test-mode-map)
                          (flycheck-mode t)))

;; gotest
(define-prefix-command 'go-test-mode-map)
(define-key go-test-mode-map (kbd "s") 'go-test-current-test)
(define-key go-test-mode-map (kbd "f") 'go-test-current-file)
(define-key go-test-mode-map (kbd "a") 'go-test-current-project)
(define-key go-test-mode-map (kbd "c") 'go-test-current-coverage)
(define-key go-test-mode-map (kbd "x") 'go-run)

;; gocode
;; go get -u github.com/nsf/gocode
(require 'go-autocomplete)
(require 'auto-complete-config)
