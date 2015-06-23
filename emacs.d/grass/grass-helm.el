
;; Interactive list refinement
(require 'helm-config)
(require 'helm-projectile)

(setq helm-buffers-fuzzy-matching t)
; (helm-autoresize-mode 1)


(evil-leader/set-key "f" 'helm-find-files)
(evil-leader/set-key "o" 'helm-buffers-list)
(evil-leader/set-key "x" 'helm-M-x)

(provide 'grass-helm)