;; ruby-mode
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)
		("\\.rjs$" . ruby-mode)
		("Rakefile$" . ruby-mode)
		)
	      auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda () (inf-ruby-keys)))

;; rcodetools with anything
;; gem install rcodetools
;; (install-elisp-from-emacswiki "anything-rcodetools.el")
(require 'rcodetools)
(require 'anything-rcodetools)

;; Command to get all Ri entries.
(setq rct-get-all-methods-command "PAGER=cat fri -l")

;; See docs in anything
(define-key anything-map "\C-z" 'anything-execute-persistent-action)

;; xmp
(define-key ruby-mode-map (kbd "M-p") 'xmp)

;; disable TAGS jump when 'rct-ri
(setq rct-find-tag-if-available nil)

;; ri-emacs
(setq ri-ruby-script (expand-file-name "~/.emacs.d/elisp/ri-emacs.rb"))
(autoload 'ri "ri-ruby.el" nil t)

;; ruby-mode hooks
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key "\M-r" 'rct-ri)
            (local-set-key "\C-cd" 'rct-ri)
            (local-set-key "\M-\C-i" 'rct-complete-symbol)
            ;; disabled. it's heavy and preventing from smooth typing.
	    ;;(setq ac-sources (append '(ac-source-rcodetools) ac-sources))
	    ))

;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(custom-set-variables '(ruby-electric-expand-delimiters-list nil))

;; ruby debug
(autoload 'rubydb "rubydb3x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; rvm
(require 'rvm)
(rvm-use-default)

;; flymake for ruby
;; Invoke ruby with '-c' to get syntax checking
(require 'flymake)
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)
(add-hook
 'ruby-mode-hook
 '(lambda ()
    ;; Don't want flymake mode for ruby regions in rhtml files
    (if (not (null buffer-file-name)) (flymake-mode))
    ;; Print error message in mini buffer
    (define-key ruby-mode-map "\C-c\C-d" 'flymake-display-err-minibuf)))
