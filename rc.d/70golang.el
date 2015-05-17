(setenv "GOPATH" (envcache/getenv "GOPATH"))

;; use latest go-mode installed from MELPA
;; go get code.google.com/p/rog-go/exp/cmd/godef
;; or
;; go get https://github.com/rogpeppe/godef
(require 'go-mode-autoloads)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") #'godef-jump)
                          (local-set-key (kbd "C-c ,") 'go-test-mode-map)
                          (local-set-key (kbd "C-c j") 'go-direx-pop-to-buffer)
                          ;; (flycheck-mode t)
                          ))

;; gotest
(define-prefix-command 'go-test-mode-map)
(define-key go-test-mode-map (kbd "s") 'go-test-current-test)
(define-key go-test-mode-map (kbd "f") 'go-test-current-file)
(define-key go-test-mode-map (kbd "a") 'go-test-current-project)
(define-key go-test-mode-map (kbd "c") 'go-test-current-coverage)
(define-key go-test-mode-map (kbd "x") 'go-run)

;; gocode
;; go get -u github.com/nsf/gocode
;; (add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/nsf/gocode/emacs"))
(require 'go-autocomplete)
(require 'auto-complete-config)

;; go-eldoc
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; golint
;; go get -u github.com/golang/lint/golint
;; (add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/golang/lint/misc/emacs"))
(require 'golint)
(push '("^\*golint*" :regexp t :dedicated t) popwin:special-display-config)

;; go-direx
;; go get -u github.com/jstemmer/gotags
(push '("^\*go-direx:" :regexp t :position left :width 0.4 :dedicated t :stick t)
      popwin:special-display-config)

;; go-errcheck
;; go get github.com/kisielk/errcheck
;; nothing needed to be required.
