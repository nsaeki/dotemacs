;; ruby-mode
(require 'ruby-mode)

(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)
                ("\\.rjs$" . ruby-mode)
                ("\\.ru$" . ruby-mode)
                ("\\.rake$" . ruby-mode)
                ("\\.thor$" . ruby-mode)
                ("Rakefile$" . ruby-mode)
                ("Gemfile$" . ruby-mode)
                ("Capfile$" . ruby-mode)
                ("Guardfile$" . ruby-mode)
                ("Vagrantfile$" . ruby-mode))
              auto-mode-alist))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; https://github.com/senny/rbenv.el
(require 'rbenv)
(global-rbenv-mode)

;; rcodetools and xmpfilter
;; gem install rcodetools
(require 'rcodetools)
;; (define-key ruby-mode-map (kbd "M-p") 'xmp)

;; ruby-dev
;; https://github.com/Mon-Ouie/ruby-dev.el
;; gem install pry yard
(autoload 'turn-on-ruby-dev "ruby-dev" nil t)
(add-hook 'ruby-mode-hook 'turn-on-ruby-dev)

(require 'ruby-end)
(add-hook 'ruby-mode-hook
  '(lambda ()
    (electric-pair-mode t)
    (electric-indent-mode t)
    (electric-layout-mode t)))

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

(require 'flymake-ruby)

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
