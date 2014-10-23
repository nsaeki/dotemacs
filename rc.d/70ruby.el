(ensure-package-installed 'ruby-mode 'flymake-ruby 'rspec-mode)
(require 'ruby-mode)

(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)
                ("\\.gemspec$" . ruby-mode)
                ("\\.rjs$" . ruby-mode)
                ("\\.ru$" . ruby-mode)
                ("\\.rake$" . ruby-mode)
                ("\\.thor$" . ruby-mode)
                ("Rakefile$" . ruby-mode)
                ("Thorfile$" . ruby-mode)
                ("Gemfile$" . ruby-mode)
                ("Procfile$" . ruby-mode)
                ("Capfile$" . ruby-mode)
                ("Guardfile$" . ruby-mode)
                ("Berksfile$" . ruby-mode)
                ("Vagrantfile$" . ruby-mode))
              auto-mode-alist))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; https://github.com/senny/rbenv.el
(ensure-package-installed 'rbenv)
(require 'rbenv)
(global-rbenv-mode)

;; rcodetools and xmpfilter
(ensure-package-installed 'smartparens)
(require 'smartparens-ruby)
;; highlight block with smartparens
;; (eval-after-load "ruby-mode"
;;   '(progn
;;      (require 'smartparens-ruby)
;;      (set-face-attribute 'sp-show-pair-match-face nil
;;                          :background "grey20" :foreground "green"
;;                          :weight 'semi-bold)))
;; (add-hook 'ruby-mode-hook 'show-smartparens-mode)

;; ruby-block
(ensure-package-installed 'ruby-block)
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; rspec-mode
(ensure-package-installed 'rspec-mode)
(require 'rspec-mode)

;; yard-mode
(ensure-package-installed 'yard-mode)
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
