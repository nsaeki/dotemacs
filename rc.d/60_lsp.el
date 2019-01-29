(require 'lsp-mode)
(require 'lsp-ui)
(require 'company-lsp)
(push 'company-lsp company-backends)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(setq lsp-auto-guess-root t)
(setq lsp-ui-doc-enable nil)
