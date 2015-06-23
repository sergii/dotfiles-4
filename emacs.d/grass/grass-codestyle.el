;; Indentation styles et al for all modes in one central location

;; Don't use tabs to indent
(setq-default indent-tabs-mode nil)

;; Always newline-and-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Default indentation
(setq-default tab-width 4)

;; Javascript
(setq-default js2-basic-offset 2)

;; JSON
(setq-default js-indent-level 2)

;; Coffeescript
(setq coffee-tab-width 2)

;; Python
(setq-default py-indent-offset 2)

;; XML
(setq-default nxml-child-indent 2)

;; Ruby
(setq ruby-indent-level 4)

;; Default formatting style for C based modes
(setq c-default-style "java")
(setq-default c-basic-offset 2)

(setq sentence-end-double-space nil)

;; Enforce proper whitespace
(setq require-final-newline t)
(add-hook 'before-save-hook 'whitespace-cleanup)

(provide 'grass-codestyle)