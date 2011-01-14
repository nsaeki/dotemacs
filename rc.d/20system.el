;; switchs by system
(cond ((eq system-type 'darwin) (load "darwin" t))
      ((eq system-type 'windows-nt) (load "cygwin" t)))
