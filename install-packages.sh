#!/usr/bin/env emacs --script
(package-initialize)
(load-file "rc.d/20_package.el")
(package-refresh-contents)
(load-file "rc.d/21_install-package.el")
