;; extensions
(setq auto-mode-alist
      (append '(("\\.t$" . cperl-mode)
                ("\\.psgi$" . cperl-mode))
              auto-mode-alist))

;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4)
(setq cperl-continued-statement-offset 4)
(setq cperl-comment-column 40)
(setq cperl-indent-parens-as-block t)
;; cperl-hairy for electric mode
;; see also: http://www.emacswiki.org/emacs/CPerlMode
;;(setq cperl-hairy t)
(add-hook 'cperl-mode-hook
          (lambda ()
            (set-face-background 'cperl-array-face nil)
            (set-face-background 'cperl-hash-face nil)
            (set-face-italic-p 'cperl-hash-face nil)
        (setq-default indent-tabs-mode nil)
        (setq-default tab-width 4)
        ))

;; http://search.cpan.org/~schwigon/pod-mode/
(require 'pod-mode)
(add-to-list 'auto-mode-alist
             '("¥¥.pod$" . pod-mode))
(add-hook 'pod-mode-hook
          '(lambda () (progn
                        (font-lock-mode)
                        (auto-fill-mode 1)
                        (flyspell-mode 1)
                        )))

;; perl-completion (require anything)
(add-hook 'cperl-mode-hook
	  (lambda()
	    (require 'perl-completion)
	    ;; with auto-complete (heavy...)
	    ;(add-to-list 'ac-sources 'ac-source-perl-completion)
	    (perl-completion-mode t)))

;; perldoc-m
(load "perldoc-m")

;; perltidy functions
;; http://d.hatena.ne.jp/hakutoitoi/20090208/1234069614
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
                  (perltidy-region)))

;; flymake for perl
;; http://d.hatena.ne.jp/antipop/20080701/1214838633
(require 'flymake)

;; set-perl5lib
;; http://svn.coderepos.org/share/lang/elisp/set-perl5lib/set-perl5lib.el
(require 'set-perl5lib)

(push '("\\(.*\\) at \\([^ \n]+\\) line \\([0-9]+\\)[,.\n]" 2 3 nil 1) flymake-err-line-patterns)
;(push '(".+\\.pl$" flymake-perl-init) flymake-allowed-file-name-masks)
(push '(".+\\.pm$" flymake-perl-init) flymake-allowed-file-name-masks)
(push '(".+\\.t$" flymake-perl-init) flymake-allowed-file-name-masks)

(add-hook 'cperl-mode-hook
          '(lambda ()
             (interactive)
             (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
               (setq flymake-check-was-interrupted t))
             (ad-activate 'flymake-post-syntax-check)
             (define-key cperl-mode-map "\C-c\C-d" 'flymake-display-err-minibuf)
             (set-perl5lib)
             (flymake-mode)))
