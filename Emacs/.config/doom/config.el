;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Anishka Patel"
      user-mail-address "anishka.vpatel@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 16 :weight 'normal)
      doom-big-font (font-spec :family "FiraCode Nerd Font" :size 20 :weight 'normal))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)
(after! doom-themes
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq which-key-use-C-h-commands t) ;; Enable paging in which key enabled binding prefixes
(add-hook 'vue-mode-hook #'lsp!) ;; Configuration for vue mode plugin in plugins.el

;; Config for org-mode
(after! org
  (setq org-log-into-drawer t) ;; Creates :LOGBOOK: drawer under each org-todo-keyword and logs into it
  (setq org-todo-keywords
        '((sequence "TODO(t!)" "PROJ(p!)" "LOOP(r!)" "STRT(s!)" "WAIT(w@)" "HOLD(h@)" "IDEA(i!)" "|" "DONE(d@)" "KILL(k@)")
          (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
          (sequence "|" "OKAY(o)" "YES(y)" "NO(n)")))
  (setq org-capture-templates '(("t" "Personal todo" entry
                                 (file+headline +org-capture-todo-file "Inbox")
                                 "* %?
                                %i
                                %a" :prepend t)
                                ("n" "Personal notes" entry
                                 (file+headline +org-capture-notes-file "Inbox")
                                 "* %u %?
                                %i
                                %a" :prepend t)
                                ("j" "Journal" entry
                                 (file+olp+datetree +org-capture-journal-file)
                                 "* %U %?
                                %i
                                %a" :prepend t)))
  ) ;; Setup custom TODO keywords
(setq +zen-text-scale 0) ;; Does not scale up text in zen modes
(beacon-mode 1) ;; Activates beacon-mode
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook! 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
  (add-hook! 'vue-mode-hook #'tree-sitter-hl-mode)) ;; Activates tree-sitter


(use-package! command-log-mode
  :ensure t
  :config (global-command-log-mode))
                                        ; (setq evil-ex-search-case nil) ;; Ignore case during evil search
(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config (setq org-auto-tangle-default t))
(use-package! dashboard
  :init
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner "~/.doom.d/doom-emacs-dash.png")
  (setq dashboard-center-content t)
  :config
  (dashboard-setup-startup-hook))
(setq doom-fallback-buffer-name "*dashboard*")
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; (add-hook! ('prog-mode-hook 'text-mode-hook) 'display-fill-column-indicator-mode)
;; (add-hook! ('writeroom-mode-hook) 'disable-display-fill-column-indicator-mode)

;; (defun disable-display-fill-column-indicator-mode ()
;;   (setq display-fill-column-indicator nil))
;;
;; (defun evil-scroll-up-and-center ()
;;   (interactive)
;;   (evil-scroll-up 0)
;;   (evil-scroll-line-to-center ()))
;; (defun evil-scroll-down-and-center ()
;;   (interactive)
;;   (evil-scroll-down 0)
;;   (evil-scroll-line-to-center ()))
;; (defun evil-scroll-page-up-and-center ()
;;   (interactive)
;;   (evil-scroll-page-up 1)
;;   (evil-scroll-line-to-center ()))
;; (defun evil-scroll-page-down-and-center ()
;;   (interactive)
;;   (evil-scroll-page-down 1)
;;   (evil-scroll-line-to-center ()))
;;
;; (map! :n "C-u" #'evil-scroll-up-and-center)
;; (map! :n "C-d" #'evil-scroll-down-and-center)
;; (map! :n "C-f" #'evil-scroll-page-down-and-center)
;; (map! :n "C-b" #'evil-scroll-page-up-and-center)

(setq evil-snipe-scope 'buffer)




                                        ; LocalWords:  el GPG xlfd
