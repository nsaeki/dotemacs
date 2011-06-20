(require 'color-theme)
(setq color-theme-load-all-themes nil)

(setq load-path (cons "~/.emacs.d/elisp/themes" load-path))

;(require 'color-theme-tangotango)
(autoload 'color-theme-railscasts "color-theme-railscasts" nil t)
(autoload 'color-theme-idle-fingers "color-theme-idle-fingers" nil t)

;; Source : http://www.emacswiki.org/emacs/ColorTheme#toc10
;; select theme - first list element is for windowing system, second is for console/terminal
(setq color-theme-choices '(color-theme-railscasts color-theme-standard))

;; default-start
(funcall (lambda (cols)
    	   (let ((color-theme-is-global nil))
    	     (eval 
    	      (append '(if (window-system))
    		      (mapcar (lambda (x) (cons x nil)) 
    			      cols)))))
    	 color-theme-choices)

;; test for each frame or console
(require 'cl)	
(lexical-let ( (cols color-theme-choices) )
  (defun test-win-sys (frame)
    (let ( (color-theme-is-global nil) )
      (select-frame frame)
      (eval (append '(if (window-system frame)) 
     		    (mapcar (lambda (x) (cons x nil)) cols))))))
;; hook on after-make-frame-functions
(add-hook 'after-make-frame-functions 'test-win-sys)

;(color-theme-tangotango)
;(color-theme-railscasts)
;(color-theme-idle-fingers)
