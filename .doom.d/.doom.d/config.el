;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John K"
      user-mail-address "hellojohnku@gmail.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight)
(setq doom-themes-treemacs-theme "Default")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;;(setq display-line-numbers-type nil)
;;(setq auto-window-vscroll nil)
(setq avy-all-windows t)
(setq mac-command-modifier 'super)

;; magit
(setq magit-git-executable "/usr/local/bin/git")
(setq magit-refresh-status-buffer nil)

(setq doom-font (font-spec :family "Operator Mono" :size 12 :weight 'Light)
      doom-variable-pitch-font (font-spec :family "Operator Mono" :size 12 :weight 'Light))

;;flycheck
(setq flycheck-indication-mode 'left-margin)
(defun my/set-flycheck-margins ()
  (setq left-fringe-width 8 right-fringe-width 8
        left-margin-width 1 right-margin-width 0)
  (flycheck-refresh-fringes-and-margins))
(add-hook 'flycheck-mode-hook #'my/set-flycheck-margins)

;; company
(setq company-minimum-prefix-length 2
      company-tooltip-limit 15
      company-idle-delay 0.2)

;; tabnine
(require 'company-tabnine)
(add-to-list 'company-backends #'company-tabnine)

(global-set-key (kbd "M-z") 'avy-goto-word-0)
(global-set-key (kbd "M-g") 'godoc-at-point)
(global-set-key (kbd "M-l") 'lsp-ui-imenu)

;; workspace
(global-set-key (kbd "M-i") '+workspace/switch-left)
(global-set-key (kbd "M-o") '+workspace/switch-right)

;; search
(global-set-key (kbd "M-f") 'counsel-projectile-rg)
(global-set-key (kbd "C-g") 'treemacs-select-window)
(global-set-key (kbd "C-g") 'treemacs-select-window)

;; navigation
(global-set-key (kbd "C-h") 'evil-window-left)
(global-set-key (kbd "C-l") 'evil-window-right)
(global-set-key (kbd "C-j") 'evil-window-down)
(global-set-key (kbd "C-k") 'evil-window-up)
(global-set-key (kbd "M-c") 'evil-window-vsplit)
(global-set-key (kbd "M-d") 'evil-window-delete)
(global-set-key (kbd "M-n") 'next-buffer)
(global-set-key (kbd "M-p") 'previous-buffer)

;; golang
(add-hook 'before-save-hook 'gofmt-before-save)
(setq gofmt-command "goimports")
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

(use-package! tmux-pane
  :config
  (tmux-pane-mode))

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
