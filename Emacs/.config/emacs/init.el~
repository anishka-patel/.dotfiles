(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(menu-bar-mode -1)            ; Disable the menu bar

(set-fringe-mode 20)        ; Give some breathing room
(setq scroll-margin 8)
(setq-default header-line-format " ")

;; Set up the visible bell
(setq visible-bell t)
(set-default-coding-systems 'utf-8)

(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 120)
(set-face-attribute 'fixed-pitch nil :font "FiraCode Nerd Font" :height 120)
(set-face-attribute 'variable-pitch nil :font "Fira Sans" :height 140)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(setq-default fill-column 80)
(column-number-mode 1)
(global-hl-line-mode 1)
(setq display-line-numbers-type 'relative)
(setq display-line-numbers-width-start 4)
(setq display-line-numbers-width 4)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'conf-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'conf-mode-hook #'display-fill-column-indicator-mode)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (setq projectile-switch-project-action #'projectile-dired)
  )

(use-package rg
  :ensure t)

(use-package counsel-projectile
 :after projectile
 :config
 (counsel-projectile-mode 1))

(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package command-log-mode)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package all-the-icons)

(use-package dracula-theme
  :init (load-theme 'dracula t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(electric-pair-mode 1)

(use-package which-key
  :init (which-key-mode 1)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-F" . 'counsel-minibuffer-history)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variabld)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package general
  :config
  (general-create-definer user/leader-keys
			  :keymaps '(normal insert visual emacs)
			  :prefix "SPC"
			  :global-prefix "M-SPC")
  (user/leader-keys
   "SPC" '(project-find-file :which-key "Find file in project")
   "RET" '(bookmark-jump :which-key "Jupm to bookmark")
   "."   '(counsel-find-file :which-key "Find file")
   ":"   '(counsel-M-x :which-key "M-x")
   "/"   '(project-search :which-key "Project regex search")
   "`"   '(previous-buffer :which-key "Switch to previous buffer")
   "a"   '(:igonre t :which-key "[a]pps")
   "aa"  '(ansi-term :which-key "[a]nsi-term")
   "ac"  '(calc :which-key "[c]alculator")
   "aC"  '(calendar :which-key "[C]alendar")
   "ad"  '(dired :which-key "[d]ired")
   "aD"  '(dashboard :which-key "[D]ashboard")
   "ae"  '(eshell :which-key "[e]shell")
   "am"  '(mpc :which-key "[m]pc")
   "as"  '(shell :which-key "[s]hell")
   "at"  '(term :which-key :which-key "[t]erm")
   "ag"  '(:ignore t :which-key "[g]ames")
   "agt" '(tetris :whihc-key "[t]etris")
   "aw"  '(eww :which-key "[w]eb")
   "b"   '(:ignore t :which-key "[b]uffers")
   "bb"  '(buffer-menu :which-key "Show [b]uffer menu")
   "bc"  '(kill-buffer :which-key "[c]lose current buffer")
   "bs"  '(save-buffer :which-key "[s]ave current buffer")
   "bp"  '(previous-buffer :which-key "Switch to [p]revious buffer")
   "bn"  '(next-buffer :which-key "Switch to [n]ext buffer")
   "c"   '(:ignore t :which-key "[c]ode")
   "d"   '(:ignore t :which-key "[d]ebug")
   "e"   '(:ignore t :which-key "[e]rror")
   "en"  '(next-error :which-key "[n]ext")
   "ep"  '(previous-error :which-key "[p]revious")
   "f"   '(:ignore t :which-key "[f]ind")
   "g"   '(:ignore t :which-key "[g]it")
   "gs"  '(magit-status :which-key "git [s]tatus")
   "gl"  '(magit-log :which-key "git [l]og")
   "h"   '(:ignore t :which-key "[h]elp")
   "h?"  '(help-for-help :which-key "Help for help")
   "hd"  '(:ignore t :which-key "[d]escribe")
   "hdb"  '(describe-bindings :which-key "[b]indings")
   "hdc"  '(describe-command :which-key "[c]ommand")
   "hdf"  '(describe-function :which-key "[f]unction")
   "hdk"  '(describe-key :which-key "[k]ey")
   "hdl"  '(describe-language-environment :which-key "[l]anguage env")
   "hdm"  '(describe-mode :which-key "[m]ode")
   "hdo"  '(descibe-symbol :which-key "symb[o]l")
   "hdp"  '(describe-package :which-key "[p]ackage")
   "hds"  '(describe-syntax :which-key "[s]yntax")
   "hdv"  '(describe-variable :which-key "[v]ariable")
   "hh"  '(:ignore t :which-key "[h]elpful")
   "hhc" '(helpful-command :which-key "[c]ommand")
   "hhk" '(helpful-key :which-key "[k]ey")
   "hhs" '(helpful-symbol :which-key "[s]ymbol")
   "hm"  '(man :which-key "[m]an pages")
   "i"   '(:ignore t :which-key "[i]nsert")
   "ie"  '(emoji-insert :which-key "[e]moji")
   "iE"  '(emojify-insert-emoji :which-key "[e]moji")
   "ii"  '(all-the-icons-insert :which-key "all [i]cons")
   "in"  '(nerd-icons-insert :which-key "[n]erd icons")
   "it"  '(org-time-stamp :which-key "[t]imestamp")
   "iT"  '(org-time-stamp-inactive :which-key "timestamp inactive")
   "j"   '(:ignore t :which-key "[j]ump")
   "k"   '(:ignore t :which-key "[k]")
   "l"   '(:ignore t :which-key "[l]sp")
   "m"   '(:ignore t :which-key "[m]ode")
   "o"   '(:ignore t :which-key "[o]rg")
   "oi"  '(:ignore t :which-key "[i]nsert")
   "p"   '(:ignore t :which-key "[p]roject")
   "p."  '(projectile-dired-other-window :which-key "dired")
   "pf"  '(projectile-find-file-dwim :which-key "[f]ind file")
   "p/"  '(projectile-ripgrep :which-key "ripgrep")
   "q"   '(:ignore t :which-key "[q]uit")
   "r"   '(:ignore t :which-key "[r]egisters")
   "s"   '(:ignore t :which-key "[s]pell")
   "sn"  '(evil-next-flyspell-error :which-key "[n]ext")
   "sp"  '(evil-prev-flyspell-error :which-key "[p]revious")
   "t"   '(:ignore t :which-key "[t]oggles")
   "tc"  '(clm/toggle-command-log-buffer :which-key "Log [c]ommands")
   "tt"  '(counsel-load-theme :which-key "[t]heme")
   "tp"  '(org-tree-slide-mode :which-key "[p]resentation")
   "tu"  '(undo-tree-visualize :which-key "[u]ndo")
   "ti"  '(ispell :which-key "i[s]pell check")
   "tf"  '(flyspell-mode :which-key "[f]lyspell check")
   "u"   '(:ignore t :which-key "[u]tility")
   "v"   '(:ignore t :which-key "[v]ersion")
   "w"   '(:ignore t :which-key "[w]indow")
   "ws"  '(:ignore t :which-key "[s]plit")
   "wsv"  '(split-window-vertically :which-key "[v]ertically")
   "wsh"  '(split-window-horizontally :which-key "[h]orizontally")
   "wM"  '(maximize-window :which-key "[M]aximize")
   "wm"  '(:igonre t :which-key "[m]ove")
   "wmh" '(evil-window-move-far-left :which-key "[h]/left") 
   "wmj" '(evil-window-move-very-bottom :which-key "[j]/down")
   "wmk" '(evil-window-move-very-top :which-key "[k]/up")
   "wml" '(evil-window-move-very-right :which-key "[l]/right") 
   "wh"  '(:ignore t :which-key "[h]eight")
   "whi" '(evil-window-increase-height :which-key "[i]ncrease")
   "whd" '(evil-window-decrease-height :which-key "[d]ecrease")
   "whs" '(evil-window-set-height :which-key "[s]et")
   "ww"  '(:ignore t :which-key "[w]idth")
   "wwi" '(evil-window-increase-width :which-key "[i]ncrease")
   "wwd" '(evil-window-decrease-width :which-key "[d]ecrease")
   "wws" '(evil-window-set-width :which-key "[s]et")
   "x"   '(:ignore t :which-key "e[x]ecute")
   "y"   '(:ignore t :which-key "[y]")
   "z"   '(:igonre t :which-key "[z]en")
   ))

(defun user/evil-hook ()
  (dolist (mode '(custom-mode
		  eshell-mode
		  git-rebase-mode
		  erc-mode
		  circe-server-mode
		  circe-chat-mode
		  circe-query-mode
		  sauron-mode
		  term-mode))
    (add-to-list 'evil-emacs-state-modes mode)))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-C-i-jump t)
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  (evil-global-set-key 'motion "gs" 'evil-avy-goto-char-2)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-snipe
  :config
    (setq evil-snipe-scope 'whole-buffer)
    (setq evil-snipe-repeat-scope 'whole-buffer)
    (evil-snipe-mode +1)
    (evil-snipe-override-mode +1))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
	  "scale text"
	  ("j" text-scale-increase "in")
	  ("k" text-scale-increase "out")
	  ("f" nil "finished" :exit t))

(user/leader-keys
 "ts" '(hydra-text-scale/body :which-key "scale text"))

(defun user/org-mode-setup ()
  (org-indent-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(use-package org
  :hook (org-mode . user/org-mode-setup)
  :config
  (setq org-hide-emphasis-markers t))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(require 'org-indent)

(use-package org-tree-slide
  :custom
  (org-image-actual-width nil))

(defun user/presentation-setup ()
  (org-display-inline-images 1)
  (display-line-numbers-mode 0)
  (setq text-scale-mode-amount 3)
  (text-scale-mode 1)
  (beacon-mode 0)
  )

(defun user/presentation-end ()
  (org-display-inline-images 0)
  (display-line-numbers-mode 1)
  (text-scale-mode 0)
  (beacon-mode 1)
  )

(use-package org-tree-slide
  :hook ((org-tree-slide-play . user/presentation-setup)
	 (org-tree-slide-stop . user/presentation-end))
  :custom
  (org-tree-slide-slide-in-effect t)
  (org-tree-slide-activate-message "Presentation started!")
  (org-tree-slide-deactivate-message "Presentation finished!")
  (org-tree-slide-header t)
  (org-tree-slide-breadrums " > ")
  (org-image-actual-width nil))

(use-package lsp-mode
  :commands (lsp lsp-deffered)
  :init
  (setq lsp-keymap "C-c l")
  :config
  (lsp-enable-which-key-integration t))

(use-package company
  :after lsp-mode
  :hook
  (prog-mode . company-mode)
  :bind
  (:map company-active-map ("<tab>" . company-complete-selection))
  (:map lsp-mode-map ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (companyy-mode . company-box-mode))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(setq lsp-ui-doc-position 'bottom)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-show-hover nil)

(use-package lsp-ivy)


(use-package term
  :config
  (setq explicit-shell-file-name "bash"))

(defun user/configure-eshell ()
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-r") 'counsel-esh-history)
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "<home>") 'eshell-bol)

  (setq eshell-history-size 10000
	eshell-buffer-maximum-lines 10000
	eshell-scroll-to-bottom-on-input t))

(use-package eshell
  :hook (eshell-first-time-mode . user/configure-eshell))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :config
  (use-package dired-single)
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;; (use-package dired-open
;;   :config
;;   (add-to-list 'dired-open-functions #'dired-open-xdg t)
;;   (setq dired-open-extensions '(("png" . "feh")
;; 				("mkv" . "mpv")
;; 				("pdf" . "zathura"))))
(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))

(use-package auto-package-update)

(use-package undo-tree
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1)
  (evil-collection-define-key '(normal visual) 'global-map "g;" 'goto-last-change)
  (evil-collection-define-key '(normal visual) 'global-map "g," 'goto-last-change-reverse))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-center-content t)
  (setq dashboard-vertically-center-content t)
  (setq dashboard-items '((recents   . 5)
                        (projects  . 5)
                        (agenda    . 5)))
  (dashboard-setup-startup-hook))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

(use-package avy)

(use-package emojify
  :hook (after-init . global-emojify-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d" "48042425e84cd92184837e01d0b4fe9f912d875c43021c3bcb7eeb51f1be5710" default))
 '(package-selected-packages
   '(evil-surround auto-package-update dired-hide-dotfiles dired-open all-the-icons-dired dired-single lsp-ivy lsp-ui company-box company lsp-mode hydra evil-collection evil general helpful counsel ivy-rich which-key rainbow-delimiters doom-modeline ivy command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
