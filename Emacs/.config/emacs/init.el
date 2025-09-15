;;; -*- lexical-binding: t -*-
;;; package --- Summary
;;; Commentary: TODO
;;; Code:
;; Load Elpaca
(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude
                              "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))
;;Install use-package support
(elpaca elpaca-use-package
  ;; Enable use-package :ensure support for Elpaca.
  (elpaca-use-package-mode))

(setq use-package-always-ensure t)
(setq package-install-upgrade-built-in t)

;; Other Settings
(setq inhibit-startup-message t)
(setq use-file-dialog nil)   ;; No file dialog
(setq use-dialog-box nil)    ;; No dialog box
(setq pop-up-windows nil)    ;; No popup windows

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(menu-bar-mode -1)            ; Disable the menu bar

(electric-pair-mode 1)
(electric-indent-mode 1)
(delete-selection-mode 1)
(savehist-mode 1)

(setq visible-bell t)
(setq scroll-margin 8)
(setq-default tab-width 4)
(setq-default header-line-format "    %b [%+]")
(setq-default line-spacing 0.1)
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq initial-buffer-choice (lambda ()
                              (get-buffer-create dashboard-buffer-name)))

(set-fringe-mode 20)        ; Give some breathing room
(set-default-coding-systems 'utf-8)

(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 120)
(set-face-attribute 'fixed-pitch nil :font "FiraCode Nerd Font" :height 120)
(set-face-attribute 'variable-pitch nil :font "Noto Sans" :height 140)
(when (member "Noto Color Emoji" (font-family-list))
  (set-fontset-font
   t 'symbol (font-spec :family "Noto Color Emoji") nil 'prepend))
(set-face-attribute 'font-lock-comment-face nil
                    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
                    :slant 'italic)
(add-to-list 'default-frame-alist
             '(font . "FiraCode Nerd Font-12"))

(require 'whitespace)
(column-number-mode 1)
(global-hl-line-mode 1)
(global-auto-revert-mode 1)
(setq display-line-numbers-width 4)
(setq display-line-numbers-type 'relative)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'conf-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'conf-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'prog-mode-hook #'whitespace-mode)
(add-hook 'conf-mode-hook #'whitespace-mode)

(setq vc-follow-symlinks t)
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package diminish)

(use-package neotree
  :config
  (setq neo-smart-open t)
  (setq neo-show-hidden-files t))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (setq projectile-switch-project-action #'projectile-dired))

(use-package rg
  :ensure t)

(use-package counsel-projectile
  :after projectile
  :config
  (counsel-projectile-mode 1))

(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom (magit-display-buffer-function
           #'magit-display-buffer-same-window-except-diff-v1))

(use-package command-log-mode)

(use-package fzf
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 15))

(use-package diff-hl
  :config
  (global-diff-hl-mode))

(use-package emms)

(use-package ivy
  :diminish
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-count-format "(%d/%d) ")
  (ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 12))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package doom-themes
  :config
  (load-theme 'doom-dracula t)
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-org-config)
  (doom-themes-neotree-config)
  (doom-themes-visual-bell-config))

(use-package rainbow-mode
  :diminish
  :hook org-mode prog-mode conf-mode)

(use-package rainbow-delimiters
  :hook ((prog-mode . rainbow-delimiters-mode)
         (conf-mode . rainbow-delimiters-mode)))

(use-package which-key
  :init (which-key-mode 1)
  :diminish
  :config
  (setq which-key-idle-delay 1)
  (setq which-key-add-column-padding 1)
  (setq which-key-max-description-length 24))

(use-package counsel
  :after ivy
  :diminish
  :config
  (counsel-mode))

(defun user/edit-config ()
  "Opens Emacs init.el file."
  (interactive)
  (find-file "~/.dotfiles/Emacs/.emacs.d/init.el"))

(use-package general
  :config
  (general-create-definer user/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "M-SPC")

  (user/leader-keys
    "SPC" '(neotree-toggle :wk "Neotree")
    "RET" '(multi-term :wk "Multi Term")
    "TAB" '(counsel-switch-buffer :wk "Switch buffer")
    "`"   '(toggle-term-term :wk "Switch terminal")
    ","   '(dired :wk "dired")
    "."   '(projectile-find-file :wk "Porject find")
    "/"   '(projectile-ripgrep :wk "Project regex")
    ":"   '(counsel-M-x :wk "M-x")
    ";"   '(counsel-projectile-switch-project :wk "Project Switch")
    "'"   '(format-all-region-or-buffer :wk "Format Buffer")
    "\""  '(dashboard-open :wk "Dashboard")
    "["   '(evil-prev-buffer :wk "Prev Buffer")
    "]"   '(evil-next-buffer :wk "Next Buffer"))

  (user/leader-keys
    "a"   '(:igonre t :wk "apps")
    "aa"  '(ansi-term :wk "ansi-term")
    "ab"  '(battery :wk "battery")
    "ac"  '(calc :wk "calculator")
    "aC"  '(calendar :wk "Calendar")
    "ad"  '(dired :wk "dired")
    "aD"  '(dashboard :wk "Dashboard")
    "ae"  '(toggle-term-eshell :wk "eshell")
    "af"  '(fortune :wk "fortune")
    "ah"  '(holidays :wk "holidays")
    "aE"  '(erc :wk "erc")
    "am"  '(mail :wk "mail")
    "ar"  '(rmail :wk "rmail")
    "ap"  '(package-install :wk "package")
    "at"  '(toggle-term-term :wk "term")
    "aT"  '(multi-term :wk "multi term")
    "ao"  '(occur :wk "occur")
    "aw"  '(eww :wk "web")
    "aW"  '(eww-open-file :wk "Web"))

  (user/leader-keys
    "aS"  '(:ignore t :wk "system")
    "aSi"  '(iwconfig :wk "iwconfig")
    "aSp"  '(ping :wk "ping")
    "aSd"  '(dig :wk "dig")
    "aSn"  '(netstat :wk "netstat")
    "aSg"  '(:ingore t :wk "grep")
    "aSgl"  '(lgrep:wk "lgrep")
    "aSgr"  '(rgrep t :wk "rgrep")
    "aSgg"  '(grep :wk "grep"))

  (user/leader-keys
    "ag"  '(:ignore t :wk "games")
    "agt" '(tetris :wk "tetris")
    "agb" '(bubbles :wk "bubbles")
    "agB" '(blackbox :wk "blackbox")
    "agd" '(doctor :wk "doctor")
    "agp" '(pong :wk "pong")
    "agg" '(gomoku :wk "gomoku")
    "agm" '(mpuz :wk "mpuz")
    "agl" '(life :wk "life")
    "ags" '(snake :wk "snake")
    "agS" '(solitaire :wk "solitaire")
    "agd" '(dunnet :wk "dunnet"))

  (user/leader-keys
    "b"   '(:ignore t :wk "buffers")
    "bb"  '(counsel-ibuffer :wk "buffer menu")
    "bB"  '(buffer-menu :wk "buffers buffer")
    "bc"  '(kill-current-buffer :wk "close buffer")
    "be"  '(evil-buffer-new :wk "buffer new")
    "bs"  '(save-buffer :wk "save cbuffer")
    "bp"  '(previous-buffer :wk "previous buffer")
    "bn"  '(next-buffer :wk "next buffer"))

  (user/leader-keys
    "c"   '(:ignore t :wk "code"))

  (user/leader-keys
    "d"   '(:ignore t :wk "debug/diff")
    "db"  '(debug :wk "debug")
    "dd"  '(ediff-directories :wk "dirs")
    "df"  '(ediff-files :wk "files")
    )

  (user/leader-keys
    "e"   '(:ignore t :wk "edit/sudo")
    "ee"  '(evil-edit :wk "evil")
    "ec"  '(user/edit-config  :wk "config")
    "es"  '(:ignore t :wk "sudo")
    "esf" '(sudo-edit-find-file :wk "find")
    "esb" '(sudo-edit :wk "buffer")
    "et"   '(:ignore t :wk "toggle")
    "ets"  '(ediff-toggle-split :wk "split")
    "etf"  '(ediff-toggle-multiframe :wk "frame"))

  (user/leader-keys
    "E"   '(:ignore t :wk "Error")
    "En"  '(next-error :wk "next")
    "Ep"  '(previous-error :wk "prev")
    "Es"   '(:ignore t :wk "spell")
    "Esn"  '(evil-next-flyspell-error :wk "next")
    "Esp"  '(evil-prev-flyspell-error :wk "prev"))

  (user/leader-keys
    "f"   '(:ignore t :wk "find")
    "f."  '(find-file-at-point :wk "ffap")
    "fa"  '(counsel-apropos :wk "apropos")
    "fb"  '(counsel-ibuffer :wk "buffer")
    "fe"  '(counsel-flycheck :wk "error")
    "ff"  '(counsel-file-jump :wk "file")
    "fF"  '(counsel-fonts :wk "Fonts")
    "fi"  '(counsel-imenu :wk "imenu")
    "ft"  '(counsel-rg :wk "text")
    "fk"  '(hl-todo-rgrep :wk "keyword")
    "fm"  '(counsel-evil-marks :wk "marks")
    "fr"  '(counsel-evil-registers :wk "registers")
    "fp"  '(counsel-projectile :wk "projectile")
    "fP"  '(counsel-package :wk "package")
    "fo"  '(counsel-org-file :wk "org")
    "fx"  '(counsel-linux-app :wk "xdg-app"))

  (user/leader-keys
    "g"   '(:ignore t :wk "git")
    "gb"  '(magit-branch :wk "branch")
    "gc"  '(magit-commit :wk "commit")
    "gC"  '(magit-clone :wk "clone")
    "gs"  '(magit-status :wk "status")
    "gS"  '(magit-stash :wk "stash")
    "gl"  '(magit-log :wk "log")
    "gL"  '(magit-reflog-current :wk "reflog")
    "gi"  '(magit-gitignore :wk "ignore")
    "gI"  '(magit-init :wk "init")
    "gp"  '(magit-pull :wk "pull")
    "gP"  '(magit-push :wk "push")
    "gg"  '(magit-dispatch :wk "magit")
    "gr"  '(magit-rebase :wk "rebase")
    "gR"  '(magit-reset :wk "Reset")
    "gd"  '(magit-diff :wk "diff")
    "gt"  '(magit-tag :wk "tag")
    "gm"  '(magit-merge :wk "merge")
    "gx"  '(magit-remote :wk "remote")
    "gw"  '(magit-worktree :wk "worktree"))

  (user/leader-keys
    "h"   '(:ignore t :wk "help")
    "h?"  '(help-for-help :wk "Help4help")
    "hd"  '(:ignore t :wk "describe")
    "hdb"  '(describe-bindings :wk "bindings")
    "hdc"  '(describe-command :wk "command")
    "hdf"  '(describe-function :wk "function")
    "hdk"  '(describe-key :wk "key")
    "hdl"  '(describe-language-environment :wk "language env")
    "hdm"  '(describe-mode :wk "mode")
    "hdo"  '(descibe-symbol :wk "symbol")
    "hdp"  '(describe-package :wk "package")
    "hds"  '(describe-syntax :wk "syntax")
    "hdv"  '(describe-variable :wk "variable")
    "hi"  '(info :wk "info")
    "hm"  '(man :wk "man pages")
    "ht"  '(tldr :wk "tldr")
    "hw"  '(woman :wk "woman")
    "hD"  '(dictionary) :wk "dictionary")

  (user/leader-keys
    "i"   '(:ignore t :wk "insert")
    "ie"  '(emoji-insert :wk "emoji")
    "iE"  '(emojify-insert-emoji :wk "emoji")
    "ii"  '(all-the-icons-insert :wk "all icons")
    "in"  '(nerd-icons-insert :wk "nerd icons")
    "it"  '(org-time-stamp :wk "timestamp")
    "iT"  '(org-time-stamp-inactive :wk "timestamp inactive"))

  (user/leader-keys
    "j"   '(:ignore t :wk "j"))

  (user/leader-keys
    "k"   '(:ignore t :wk "k"))

  (user/leader-keys
    "l"   '(:ignore t :wk "lsp")
    "le"  '(eglot :wk "eglot"))

  (user/leader-keys
    "m"   '(:ignore t :wk "mode")
    "mc"  '(flycheck-mode :wk "flycheck")
    "md"  '(rainbow-delimiters-mode :wk "delimiters")
    "me"  '(:ignore t :wk "evil")
    "mee"  '(evil-emacs-state :wk "emacs")
    "mev"  '(evil-mode :wk "evil")
    "mes"  '(evil-snipe-mode :wk "snipe")
    "mey"  '(evil-surround-mode :wk "surround")
    "mec"  '(evil-commentary-mode :wk "commentary")
    "mw"  '(writeroom-mode :wk "writeroom")
    "mc" '(command-log-mode :wk "command")
    "mt" '(tabify :wk "tabify")
    "mr" '(rainbow-mode :wk "rainbow")
    "mR" '(read-only-mode :wk "readonly")
    "mu" '(untabify :wk "untabify")
    "mf" '(flyspell-mode :wk "flyspell")
    "mF" '(format-all-mode :wk "format")
    "ml" '(display-line-numbers-mode :wk "linenum")
    "mv" '(display-fill-column-indicator-mode :wk "visual fill"))

  (user/leader-keys
    "n"   '(:ignore t :wk "n"))

  (user/leader-keys
    "o"   '(:ignore t :wk "org")
    "oa"  '(org-agenda :wk "agenda")
    "oe"  '(org-export-dispatch :wk "export")
    "oB"  '(:ignore :wk "babel")
    "oi"  '(:ignore t :wk "insert")
    "oit" '(org-insert-time-stamp :wk "timestamp")
    "oil" '(org-insert-link :wk "link")
    "oia" '(org-insert-all-links :wk "all")
    "ois" '(org-insert-last-stored-link :wk "stored link")
    "oig" '(org-insert-link-global :wk "global link")
    "oid" '(org-insert-drawer :wk "drawer")
    "ol"  '(:ignore t :wk "link")
    "ols" '(org-store-link :wk "store")
    "olS" '(org-id-store-link :wk "store id")
    "olo" '(org-link-open-from-string :wk "open")
    "oo"  '(org-open-at-point :wk "open")
    "oO"  '(org-open-at-point-global :wk "open global")
    "oT"  '(:ignore t :wk "toggle")
    "oTd" '(org-toggle-timestamp-type :wk "date")
    "oTt" '(toc-org-mode :wk "toc")
    "oTs" '(org-timer-set-timer :wk "Timer set")
    "oTp" '(org-timer-pause-or-continue :wk "Timer pause")
    "oTx" '(org-timer-stop :wk "Timer stop")
    "oTi" '(org-toggle-inline-images :wk "Images")
    "oTl" '(org-toggle-link-display :wk "Link")
    "ot"  '(:ignore t :wk "table")
    "ota" '(org-table-align :wk "align")
    "otc" '(org-table-create :wk "create")
    "ote" '(org-table-expand :wk "expand")
    "ots" '(org-table-shrink :wk "shrink")
    "oti" '(org-table-import :wk "import")
    "otx" '(org-table-export :wk "export")
    "oti" '(:igonoe t :wk "insert")
    "otir"'(org-table-insert-row :wk "row")
    "otic"'(org-table-insert-column :wk "column")
    "otil"'(org-table-insert-hline :wk "hline")
    "otm" '(:ignore t :wk "move")
    "otmc" '(:ignore t :wk "column")
    "otmcc" '(org-table-move-column :wk "column")
    "otmch" '(org-table-move-column-left :wk "left")
    "otmcl" '(org-table-move-column-right :wk "right")
    "otmr" '(:ignroe t :wk "row")
    "otmrr" '(org-table-move-row :wk "row")
    "otmrj" '(org-table-move-row-down :wk "down")
    "otmrk" '(org-table-move-row-up :wk "up")
    "otmf" '(:ingore t :wk "field")
    "otmfh"'(org-table-move-cell-left :wk "left")
    "otmfj"'(org-table-move-cell-down :wk "down")
    "otmfk"'(org-table-move-cell-up :wk "up")
    "otmfl"'(org-table-move-cell-right :wk "right")
    )

  (user/leader-keys
    "O" '(:ignore t :wk "open")
    "Of" '(ffap :wk "file")
    "Ow" '(eww-follow-link :wk "web")
    "Ox" '(browse-url-xdg-open :wk "xdg")
    )

  (user/leader-keys
    "p"   '(:ignore t :wk "project")
    "p."  '(projectile-dired-other-window :wk "dired")
    "p/"  '(projectile-ripgrep :wk "ripgrep")
    "p;"  '(projectile-switch-project :wk "project")
    "pf"  '(projectile-find-file-other-window :wk "file")
    "pd"  '(projectile-dired-other-window :wk "dired")
    "ps"  '(projectile-switch-project :wk "switch"))

  (user/leader-keys
    "q"   '(:ignore t :wk "q"))

  (user/leader-keys
    "r"   '(:ignore t :wk "r"))

  (user/leader-keys
    "s"   '(:ignore t :wk "search")
    "sf"  '(fzf-find-file :wk "file")
    "ss"  '(fzf-grep :wk "grep")
    "sb"  '(fzf-switch-buffer :wk "buffer")
    "sd"  '(fzf-directory :wk "directory")
    "sp"  '(fzf-projectile :wk "project")
    "st"  '(fzf-find-in-buffer :wk "text"))

  (user/leader-keys
    "t"   '(:ignore t :wk "toggles")
    "tc"  '(clm/toggle-command-log-buffer :wk "Log commands")
    "te"  '(toggle-term-eshell :wk "eshell")
    "tF"  '(toggle-frame-fullscreen :wk "fullscreen")
    "tM"  '(toggle-frame-maximized :wk "maximize")
    "ts"  '(toggle-term-shell :wk "shell")
    "tt"  '(toggle-term-term :wk "term")
    "tT"  '(counsel-load-theme :wk "theme")
    "tp"  '(org-tree-slide-mode :wk "presentation")
    "tu"  '(undo-tree-visualize :wk "undo")
    "ti"  '(ispell :wk "ispell check")
    "tw"  '(toggle-word-wrap :wk "wrap"))

  (user/leader-keys
    "u"   '(:ignore t :wk "u"))

  (user/leader-keys
    "v"   '(:ignore t :wk "v"))

  (user/leader-keys
    "w"   '(:ignore t :wk "window")
    "wc"  '(kill-buffer-and-window :wk "close")
    "ws"  '(:ignore t :wk "split")
    "wsv"  '(split-window-vertically :wk "vertically")
    "wsh"  '(split-window-horizontally :wk "horizontally")
    "wM"  '(maximize-window :wk "Maximize")
    "wm"  '(:igonre t :wk "move")
    "wmh" '(evil-window-move-far-left :wk "h/left")
    "wmj" '(evil-window-move-very-bottom :wk "j/down")
    "wmk" '(evil-window-move-very-top :wk "k/up")
    "wml" '(evil-window-move-very-right :wk "l/right")
    "wh"  '(:ignore t :wk "height")
    "whi" '(evil-window-increase-height :wk "increase")
    "whd" '(evil-window-decrease-height :wk "decrease")
    "whs" '(evil-window-set-height :wk "set")
    "ww"  '(:ignore t :wk "width")
    "wwi" '(evil-window-increase-width :wk "increase")
    "wwd" '(evil-window-decrease-width :wk "decrease")
    "wws" '(evil-window-set-width :wk "set"))

  (user/leader-keys
    "x"   '(:ignore t :wk "x"))

  (user/leader-keys
    "y"   '(:ignore t :wk "y"))

  (user/leader-keys
    "z"   '(:igonre t :wk "z")))

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
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  :config
  (evil-mode 1)
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

(use-package flycheck
  :ensure t
  :defer t
  :diminish
  :init (global-flycheck-mode))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package evil-snipe
  :ensure t
  :after evil
  :config
  (setq evil-snipe-scope 'whole-buffer)
  (setq evil-snipe-repeat-scope 'whole-buffer)
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

(use-package evil-commentary
  :ensure t
  :after evil
  :config
  (evil-commentary-mode))

(use-package evil-surround
  :ensure t
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(defun user/org-mode-setup ()
  (org-indent-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (org-toggle-pretty-entities)
  (setq evil-auto-indent nil))

(use-package org
  :hook (org-mode . user/org-mode-setup)
  :config
  (setq org-hide-emphasis-markers t)
  (setq org-src-preserve-indentation t)
  :ensure (:wait t))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(require 'org-indent)
(require 'org-tempo)

(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode))

(use-package org-modern
  :hook (org-mode . org-modern-mode))

(use-package toc-org
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

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

(use-package tldr)

(use-package format-all
  :commands format-all-mode
  :hook ((prog-mode . format-all-mode)
         (conf-mode . format-all-mode))
  :config
  (setq-default format-all-formatters
                '(("C"     (astyle "--mode=c"))
                  ("Shell" (shfmt "-i" "4" "-ci")))))

(use-package company
  :hook (after-init . global-company-mode)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0))

(use-package company-box
  :hook (companyy-mode . company-box-mode))

(use-package term
  :config
  (setq explicit-shell-file-name "/bin/bash")
  :ensure nil)

(use-package multi-term
  :config
  (setq multi-term-program "/bin/bash"))

(use-package toggle-term
  :bind (("M-o f" . toggle-term-find)
         ("M-o t" . toggle-term-term)
         ("M-o v" . toggle-term-vterm)
         ("M-o a" . toggle-term-eat)
         ("M-o s" . toggle-term-shell)
         ("M-o e" . toggle-term-eshell)
         ("M-o i" . toggle-term-ielm)
         ("M-o o" . toggle-term-toggle))
  :config
  (setq toggle-term-size 25)
  (setq toggle-term-switch-upon-toggle t))

(defun user/configure-eshell ()
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  (evil-define-key
    '(normal insert visual) eshell-mode-map (kbd "C-r") 'counsel-esh-history)
  (evil-define-key
    '(normal insert visual) eshell-mode-map (kbd "<home>") 'eshell-bol)

  (setq eshell-history-size 10000
        eshell-buffer-maximum-lines 10000
        eshell-scroll-to-bottom-on-input t))

(use-package eshell
  :hook (eshell-first-time-mode . user/configure-eshell))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :config
  (all-the-icons-dired-mode 1)
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file))

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(use-package all-the-icons-dired)

(use-package auto-package-update)

(use-package undo-tree
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1)
  (evil-collection-define-key
    '(normal visual) 'global-map "g;" 'goto-last-change)
  (evil-collection-define-key
    '(normal visual) 'global-map "g," 'goto-last-change-reverse))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-center-content t)
  (setq dashboard-vertically-center-content t)
  (setq dashboard-items '((recents   . 5)
                          (projects  . 5)
                          (agenda    . 5)))
  (dashboard-setup-startup-hook))

(use-package indent-guide)
(add-hook 'prog-mode-hook 'indent-guide-mode)
(add-hook 'conf-mode-hook 'indent-guide-mode)

(use-package emojify
  :hook (after-init . global-emojify-mode))

(use-package hl-todo
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

(use-package sudo-edit)

(use-package writeroom-mode)

(setq wl-copy-process nil)
(defun wl-copy (text)
  (setq wl-copy-process (make-process :name "wl-copy"
                                      :buffer nil
                                      :command '("wl-copy" "-f" "-n")
                                      :connection-type 'pipe
                                      :noquery t))
  (process-send-string wl-copy-process text)
  (process-send-eof wl-copy-process))
(defun wl-paste ()
  (if (and wl-copy-process (process-live-p wl-copy-process))
      nil ; should return nil if we're the current paste owner
    (shell-command-to-string "wl-paste -n | tr -d \r")))
(setq interprogram-cut-function 'wl-copy)
(setq interprogram-paste-function 'wl-paste)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d"
     "48042425e84cd92184837e01d0b4fe9f912d875c43021c3bcb7eeb51f1be5710" default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
