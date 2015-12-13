;;; packages.el --- evil-little-word Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; RG: Clear out reverse search motion mapping and add my own motion mappings for little word.
(define-key evil-motion-state-map "," nil)
(define-key evil-motion-state-map (kbd ",w") 'evil-forward-little-word-begin)
(define-key evil-motion-state-map (kbd ",b") 'evil-backward-little-word-begin)
;; (define-key evil-motion-state-map (kbd "glw") 'evil-forward-little-word-begin)
;; (define-key evil-motion-state-map (kbd "glb") 'evil-backward-little-word-begin)

(define-key evil-motion-state-map (kbd "glW") 'evil-forward-little-word-end)
(define-key evil-motion-state-map (kbd "glB") 'evil-backward-little-word-end)

;; RG: My preferred mappings for text objects.
(define-key evil-outer-text-objects-map (kbd ",w") 'evil-a-little-word)
(define-key evil-inner-text-objects-map (kbd ",w") 'evil-inner-little-word)
;; (define-key evil-outer-text-objects-map (kbd "lw") 'evil-a-little-word)
;; (define-key evil-inner-text-objects-map (kbd "lw") 'evil-inner-little-word)

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
