;; ruby-mode
(require 'ruby-mode)
;(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)
                ("\\.rjs$" . ruby-mode)
                ("Rakefile$" . ruby-mode))
              auto-mode-alist))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-keys))

;; rcodetools with anything
;; gem install rcodetools
;; (install-elisp-from-emacswiki "anything-rcodetools.el")
(require 'rcodetools)
(require 'anything-rcodetools)

;; Command to get all Ri entries.
;; (setq rct-get-all-methods-command "PAGER=cat fri -l")

;; See docs in anything
;(define-key anything-map "\C-z" 'anything-execute-persistent-action)

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

;; snippet
;; requires it because 'snippet-insert' is called when expanding
;; from auto-completed word such as 'where', 'each' and so on.
(require 'snippet)

;; rvm
;(require 'rvm)
;(rvm-use-default)

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
    (if (not (null buffer-file-name)) (flymake-mode))))


;; http://d.hatena.ne.jp/kitokitoki/20110302/p1
;(require 'anything)

(defvar anything-gem-open-ruby-command "ruby -rubygems -e 'puts Dir[\"{#{Gem::Specification.dirs.join(\",\")}}/*.gemspec\"].collect {|s| File.basename(s).gsub(/\.gemspec$/, \"\")}'")
(defvar anything-c-source-gem-open      
  '((name . "gem open")
    (init . (lambda ()
              (let ((buffer (anything-candidate-buffer 'global)))
                (with-current-buffer buffer
                  (call-process-shell-command anything-gem-open-ruby-command  nil buffer)
                  (sort-lines nil (point-min) (point-max))))))
    (candidates-in-buffer)
    (candidate-number-limit . 99999)
    (action ("Open" . anything-c-source-gem-open-action))))

(defun anything-c-source-gem-open-action (candidate)
  (unless (executable-find "which-gemfile.rb")
    (error "couldn't find which-gemfile.rb in your path."))
  (find-file (with-temp-buffer
               (call-process "which-gemfile.rb" nil t 0 candidate)
               (delete-backward-char 1)
               (buffer-string))))

(defun anything-gem-open ()
  (interactive)
  (anything anything-c-source-gem-open))

(defalias 'gem 'anything-gem-open)
