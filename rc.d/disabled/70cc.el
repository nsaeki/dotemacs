;; extensions
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode)
                ("\\.hpp$" . c++-mode)
                ("\\.tcc$" . c++-mode))
	      auto-mode-alist))

;; flymake for C++
;; http://d.hatena.ne.jp/nyaasan/20071216/p1
(require 'flymake)

(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

(push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)

(add-hook 'c++-mode-hook
          '(lambda ()
             (flymake-mode t)))
