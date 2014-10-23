(require 'package)
(package-initialize)

;; Marmalade
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; MELPA
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))

;; Org-mode
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

(when (not package-archive-contents)
  (package-refresh-contents))

;; automatically install package
;; ref. http://j.mp/1i5ov4T  (a little customized)
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed,
Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (unless (package-installed-p package)
       (package-install package)))
   packages))
