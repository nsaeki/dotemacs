;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (el-get-checksum el-get-make-recipes el-get-cd
;;;;;;  el-get-self-update el-get-update-all el-get-version) "el-get/el-get"
;;;;;;  "el-get/el-get.el" (20629 13814))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE &optional PACKAGE-STATUS-ALIST)" t nil)

;;;***

;;;### (autoloads (el-get-list-packages) "el-get/el-get-list-packages"
;;;;;;  "el-get/el-get-list-packages.el" (20629 13814))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads (turn-off-mcomplete-mode turn-on-mcomplete-mode
;;;;;;  mcomplete-mode) "mcomplete/mcomplete" "mcomplete/mcomplete.el"
;;;;;;  (20629 13626))
;;; Generated autoloads from mcomplete/mcomplete.el

(autoload 'mcomplete-mode "mcomplete/mcomplete" "\
Toggle minibuffer completion with prefix and substring matching.
With ARG, turn the mode on if ARG is positive, off otherwise.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-mcomplete-mode "mcomplete/mcomplete" "\
Turn on minibuffer completion with prefix and substring matching.

\(fn)" t nil)

(autoload 'turn-off-mcomplete-mode "mcomplete/mcomplete" "\
Turn off minibuffer completion with prefix and substring matching.

\(fn)" t nil)

;;;***

;;;### (autoloads (smart-compile) "smart-compile/smart-compile" "smart-compile/smart-compile.el"
;;;;;;  (20629 13626))
;;; Generated autoloads from smart-compile/smart-compile.el

(autoload 'smart-compile "smart-compile/smart-compile" "\
An interface to `compile'.
It calls `compile' or other compile function,
which is defined in `smart-compile-alist'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (soccur se/make-summary-buffer-mouse) "summarye/summarye"
;;;;;;  "summarye/summarye.el" (20629 13626))
;;; Generated autoloads from summarye/summarye.el

(autoload 'se/make-summary-buffer-mouse "summarye/summarye" "\


\(fn E)" t nil)

(autoload 'soccur "summarye/summarye" "\
Show all lines in the current buffer containing a match for regexp.
Through the generated buffer, you can scroll, hilighten or get some statistics
data of the original buffer.

\(fn REGEXP)" t nil)

;;;***

;;;### (autoloads (visual-basic-mode) "visual-basic-mode/visual-basic-mode"
;;;;;;  "visual-basic-mode/visual-basic-mode.el" (20629 18709))
;;; Generated autoloads from visual-basic-mode/visual-basic-mode.el

(autoload 'visual-basic-mode "visual-basic-mode/visual-basic-mode" "\
A mode for editing Microsoft Visual Basic programs.
Features automatic indentation, font locking, keyword capitalization,
and some minor convenience functions.
Commands:
\\{visual-basic-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (wdired-change-to-wdired-mode) "wdired/wdired"
;;;;;;  "wdired/wdired.el" (20629 15152))
;;; Generated autoloads from wdired/wdired.el

(autoload 'wdired-change-to-wdired-mode "wdired/wdired" "\
Put a dired buffer in a mode in which filenames are editable.
In this mode the names of the files can be changed, and after
typing C-c C-c the files and directories in disk are renamed.

See `wdired-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("color-theme-idlefingers/color-theme-idle-fingers.el"
;;;;;;  "el-get/el-get-autoloads.el" "el-get/el-get-build.el" "el-get/el-get-byte-compile.el"
;;;;;;  "el-get/el-get-core.el" "el-get/el-get-custom.el" "el-get/el-get-dependencies.el"
;;;;;;  "el-get/el-get-install.el" "el-get/el-get-methods.el" "el-get/el-get-notify.el"
;;;;;;  "el-get/el-get-recipes.el" "el-get/el-get-status.el" "grep-edit/grep-edit.el"
;;;;;;  "recentf-ext/recentf-ext.el") (20629 18709 512096))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
