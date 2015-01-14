(add-to-list 'auto-mode-alist '("Berksfile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; https://github.com/senny/rbenv.el
;; (require 'rbenv)
(setq rbenv-show-active-ruby-in-modeline nil)
(global-rbenv-mode)

;; Already required in smartparen-config in 40smartparens.el.
;; (require 'smartparens-ruby)

;; This will be hooked some ruby-modes and auto-loaded.
;; (require 'rspec-mode)

;; yard-mode
(add-hook 'ruby-mode-hook 'yard-mode)

;; launch pry in inf-ruby
;; https://gist.github.com/jsvnm/1390890
(require 'inf-ruby)
(add-to-list 'inf-ruby-implementations '("pry" . "pry"))
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-first-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)> *")
(setq inf-ruby-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)[>*\"'] *")

;; open gem source
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
