;; ruby-mode
(require 'ruby-mode)

(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)
                ("\\.rjs$" . ruby-mode)
                ("\\.ru$" . ruby-mode)
                ("\\.rake$" . ruby-mode)
                ("^Rakefile" . ruby-mode)
                ("^Gemfile" . ruby-mode)
                ("^Vagrantfile" . ruby-mode))
              auto-mode-alist))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; rbenv
;; Setting rbenv path
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
                       (getenv "HOME") "/.rbenv/bin:"
                       (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims")
                      (cons (concat (getenv "HOME") "/.rbenv/bin")
                            exec-path)))
;; https://github.com/senny/rbenv.el
;; (require 'rbenv)
;; (global-rbenv-mode)

;; rcodetools
;; gem install rcodetools
(require 'rcodetools)
;; xmpfilter
(define-key ruby-mode-map (kbd "M-p") 'xmp)
;; disable TAGS jump when 'rct-ri
;; (setq rct-find-tag-if-available nil)
;; ruby-mode hooks
;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (local-set-key "\M-r" 'rct-ri)
;;             (local-set-key "\C-cd" 'yari)
;;             (local-set-key "\M-\C-i" 'rct-complete-symbol)))

;; ruby-dev
;; https://github.com/Mon-Ouie/ruby-dev.el
;; gem install pry yard
(autoload 'turn-on-ruby-dev "ruby-dev" nil t)
(add-hook 'ruby-mode-hook 'turn-on-ruby-dev)

;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(custom-set-variables '(ruby-electric-expand-delimiters-list nil))

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; snippet
;; requires it because 'snippet-insert' is called when expanding
;; from auto-completed word such as 'where', 'each' and so on.
;; (require 'snippet)

(require 'flymake-ruby)

;; flymake for ruby
;; Invoke ruby with '-c' to get syntax checking
;; (require 'flymake)
;; (defun flymake-ruby-init ()
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;          (local-file  (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;     (list "ruby" (list "-c" local-file))))
;; (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
;; (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
;; (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)
;; (add-hook
;;  'ruby-mode-hook
;;  '(lambda ()
;;     ;; Don't want flymake mode for ruby regions in rhtml files
;;     (if (not (null buffer-file-name)) (flymake-mode))))


;; http://d.hatena.ne.jp/kitokitoki/20110302/p1
(defvar helm-gem-open-ruby-command "ruby -rubygems -e 'puts Dir[\"{#{Gem::Specification.dirs.join(\",\")}}/*.gemspec\"].collect {|s| File.basename(s).gsub(/\.gemspec$/, \"\")}'")
(defvar helm-c-source-gem-open      
  '((name . "gem open")
    (init . (lambda ()
              (let ((buffer (helm-candidate-buffer 'global)))
                (with-current-buffer buffer
                  (call-process-shell-command helm-gem-open-ruby-command  nil buffer)
                  (sort-lines nil (point-min) (point-max))))))
    (candidates-in-buffer)
    (candidate-number-limit . 99999)
    (action ("Open" . helm-c-source-gem-open-action))))

(defun helm-c-source-gem-open-action (candidate)
  (unless (executable-find "which-gemfile.rb")
    (error "couldn't find which-gemfile.rb in your path."))
  (find-file (with-temp-buffer
               (call-process "which-gemfile.rb" nil t 0 candidate)
               (delete-backward-char 1)
               (buffer-string))))

(defun helm-gem-open ()
  (interactive)
  (helm helm-c-source-gem-open))

(defalias 'gem 'helm-gem-open)
