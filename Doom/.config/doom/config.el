;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Performance tweaks
(setq gc-cons-threshold (* 512 1024 1024))
(setq read-process-output-max (* 8 1024 1024))
(setq gc-cons-percentage 0.5)
(run-with-idle-timer 5 t #'garbage-collect)
;; (setq garbage-collection-messages t)
;; (setq native-comp-deferred-compilation t)
(setq native-comp-jit-compilation t)
(setq native-comp-async-jobs-number 8)

(setq gcmh-idle-delay 5)
(setq gcmh-high-cons-threshold (* 1024 1024 1024))

(setq vc-handled-backends '(Git))

(setq which-key-idle-delay 0.2)

(setq user-full-name "Anishka Patel"
      user-mail-address "anishka.vpatel@gmail.com")

(setq-default tab-width 4)
;;(setq scroll-margin 8)

(setq-default line-spacing 0.1)
(setq-default fill-column 80)
(when (display-graphic-p)
  (set-fringe-mode 20))
                                        ; Give some breathing room

(require 'whitespace)
(add-hook 'prog-mode-hook #'whitespace-mode)
(add-hook 'conf-mode-hook #'whitespace-mode)

(setq vc-follow-symlinks t)

(setq delete-by-moving-to-trash t)
(setq auto-save-default t)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "IosevkaTerm NFM" :size 20)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 20)
      doom-big-font (font-spec :family "IosvekaTerm NFM" :size 32))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)
(setq doom-themes-enable-bold t)
(setq doom-themes-enable-italic t)
(setq fancy-splash-image "~/.config/doom/svg/doom/doomEmacsDracula.svg")

(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-lsp-icon t)
(setq doom-modeline-major-mode-color-icon t)

(set-frame-parameter (selected-frame) 'alpha '(96 . 98))
(add-to-list 'default-frame-alist '(alpha . (96 . 98)))

(blink-cursor-mode)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-width 4)
(setq display-line-numbers-type `relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(defun user/presentation-setup ()
  (org-display-inline-images 1)
  (display-line-numbers-mode 0)
  (setq text-scale-mode-amount 2)
  (text-scale-mode 1)
  (display-fill-column-indicator-mode 0)
  )

(defun user/presentation-end ()
  (org-display-inline-images 0)
  (display-line-numbers-mode 1)
  (display-fill-column-indicator-mode 1)
  (text-scale-mode 0)
  )

(use-package! rainbow-delimiters
  :hook ((prog-mode-hook . rainbow-delimiters-mode)
         (conf-mode-hook . rainbow-delimiters-mode)
         (text-mode-hook . rainbow-delimiters-mode)
         (org-mode-hook . rainbow-delimiters-mode)))

(use-package! org-tree-slide
  :hook ((org-tree-slide-play . user/presentation-setup)
         (org-tree-slide-stop . user/presentation-end))
  :custom
  (org-tree-slide-slide-in-effect t)
  (org-tree-slide-activate-message "Presentation started!")
  (org-tree-slide-deactivate-message "Presentation finished!")
  (org-tree-slide-header t)
  (org-tree-slide-breadrums " > ")
  (org-image-actual-width nil))

(use-package! hl-todo
  :hook ((org-mode . hl-todo-mode)
         (prog-mode . hl-todo-mode))
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("FIXME"      error bold)
          ("HACK"       font-lock-constant-face bold)
          ("REVIEW"     font-lock-keyword-face bold)
          ("NOTE"       success bold)
          ("DEPRECATED" font-lock-doc-face bold))))
(use-package! org
  :hook (org-mode . (lambda () (org-indent-mode -1))))

(org-indent-mode -1)
(after! org
  (org-indent-mode -1)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((js . t)
     (shell . t)
     (python . t)
     (emacs-lisp . t)
     (jupyter . t)))
  (require 'ox-ipynb)
  ;; Add JavaScript kernelspec
  (add-to-list 'ox-ipynb-kernelspecs
               '(js . (kernelspec . ((display-name . "JavaScript (Node.js)")
                                     (language . "javascript")
                                     (name . "javascript-node")))))

  ;; Add JavaScript language info
  (add-to-list 'ox-ipynb-language-infos
               '(js . (language-info . ((codemirror-mode . "javascript")
                                        (file-extension . ".js")
                                        (mimetype . "text/javascript")
                                        (name . "javascript")
                                        (pygments-lexer . "javascript")
                                        (version . "18.0.0"))))) ;; Adjust version as needed
  (setq org-src-fontify-natively t)
  (setq org-src-preserve-indentation t)
  (setq org-src-tab-acts-natively t)
  (setq org-src-window-setup 'current-window))
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package!'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
(use-package! evil
  :config
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  (define-key evil-normal-state-map (kbd "H") 'evil-prev-buffer)
  (define-key evil-normal-state-map (kbd "L") 'evil-next-buffer)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(map!
 :n "C-h" #'evil-window-left
 :n "C-j" #'evil-window-down
 :n "C-k" #'evil-window-up
 :n "C-l" #'evil-window-right)
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
