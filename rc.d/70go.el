;; use latest go-mode installed from MELPA
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
(require 'go-autocomplete)
(require 'auto-complete-config)
