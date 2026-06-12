;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" default))
 '(safe-local-variable-values
   '((eval add-hook 'after-save-hook 'org-pandoc-export-to-markdown)
     (eval add-hook 'after-save-hook 'org-pandoc-export-to-markdown-and-open)
     (eval add-hook 'after-save-hook 'org-babel-tangle))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
