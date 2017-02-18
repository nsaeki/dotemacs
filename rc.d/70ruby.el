(add-to-list 'auto-mode-alist '("Berksfile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(setq ruby-insert-encoding-magic-comment nil)

;; https://github.com/senny/rbenv.el
;; (require 'rbenv)
(setq rbenv-show-active-ruby-in-modeline nil)
(global-rbenv-mode)

;; Already required in smartparen-config in 40smartparens.el.
;; (require 'smartparens-ruby)

;; launch pry in inf-ruby
;; https://gist.github.com/jsvnm/1390890
(require 'inf-ruby)
(setq inf-ruby-default-implementation "pry")
(define-key inf-ruby-minor-mode-map (kbd "C-c C-z")
  (lambda ()
    (interactive)
    (inf-ruby)))
(push '("^\*pry\*" :regexp 1 :height 25) popwin:special-display-config)

;; yard-mode
(add-hook 'ruby-mode-hook 'yard-mode)

;; rspec-mode
;; This will be hooked some ruby-modes and auto-loaded.
;; (require 'rspec-mode)

;; ruby-test-mode
;; Also hooked in ruby-test-mode.el, but it isn't marked autoload.
(add-hook 'ruby-mode-hook 'ruby-test-mode)

;; Recognize test_*.rb as a test file
(defun my-advice:ruby-prefixed-test-p (filename)
  (and (string-match "^test_" (file-name-base filename))
       (string-match "^rb$" (file-name-extension filename))))
(advice-add 'ruby-test-p :after-until 'my-advice:ruby-prefixed-test-p)
;; (advice-remove 'ruby-test-p 'my-advice:ruby-prefixed-test-p)

;; minitest-mode
;; Avoid conflict with rspec-mode prefix
(custom-set-variables
 '(minitest-keymap-prefix (kbd "C-c .")))

;; Needs the same advice as ruby-test-mode
(advice-add 'minitest-test-file-p :after-until
            'my-advice:ruby-prefixed-test-p)

;; rcodetooles
;; (require 'rcodetools)
;; (define-key ruby-mode-map (kbd "C-c , x") 'xmp)
;; (define-key ruby-mode-map (kbd "C-c C-d") 'xmp)

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
