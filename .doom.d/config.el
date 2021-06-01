;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John K"
      doom-theme 'doom-monokai-spectrum
      user-mail-address "hellojohnku@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; (setq doom-font (font-spec :family "Operator Mono for Powerline" :size 12 :weight 'Book)
;;       doom-variable-pitch-font (font-spec :family "Operator Mono for Powerline" :size 12 :weight 'Book))

(setq doom-font (font-spec :family "Operator Mono" :weight 'Medium))

;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can eitherOperator Mono for Powerline set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

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
;;(setq magit-git-executable "/usr/local/bin/git")
;;(setq magit-refresh-status-buffer nil)

;; prettier settings
(setq prettier-js-args '(
  "--trailing-comma" "none"
  "--semi" "true"
  "--single-quote" "true"
  "--bracket-spacing" "true"
))

;; disable keyboard yanking
(remove-hook 'tty-setup-hook 'doom-init-clipboard-in-tty-emacs-h)

(setq-default tab-width 2)
;; allow look up to other window
(dolist (fn '(definition references))
  (fset (intern (format "+lookup/%s-other-window" fn))
        (lambda (identifier &optional arg)
          "TODO"
          (interactive (list (doom-thing-at-point-or-region)
                             current-prefix-arg))
          (let ((pt (point)))
            (switch-to-buffer-other-window (current-buffer))
            (goto-char pt)
            (funcall (intern (format "+lookup/%s" fn)) identifier arg)))))

;; company
;; (setq company-minimum-prefix-length 3
;;       company-tooltip-limit 15
;;       company-idle-delay 1)
;; (global-set-key (kbd "ESC TAB") 'company-complete)

;; tabnine
(require 'company-tabnine)
(add-to-list 'company-backends #'company-tabnine)

;; git gutter
(global-git-gutter-mode t)

;; look up
(global-set-key (kbd "M-f") 'counsel-ag)
(global-set-key (kbd "M-z") 'avy-goto-word-0)
(global-set-key (kbd "M-a") 'avy-goto-char-timer)
(global-set-key (kbd "M-g") 'godoc-at-point)
(global-set-key (kbd "M-d") '+lookup/definition-other-window)
(global-set-key (kbd "M-r") '+lookup/references)
(global-set-key (kbd "C-i") 'better-jumper-jump-forward)

;; buffer, windows, workspaces
(global-set-key (kbd "C-h") 'evil-window-left)
(global-set-key (kbd "C-l") 'evil-window-right)
(global-set-key (kbd "C-j") 'evil-window-down)
(global-set-key (kbd "C-k") 'evil-window-up)
(global-set-key (kbd "M-n") 'evil-window-vsplit)
(global-set-key (kbd "M-w") 'evil-window-delete)

(global-set-key (kbd "M-h") '+workspace/switch-left)
(global-set-key (kbd "M-l") '+workspace/switch-right)
(global-unset-key (kbd "M-k"))
(global-unset-key (kbd "M-j"))
(global-set-key (kbd "M-j") 'git-gutter:next-hunk)
(global-set-key (kbd "M-k") 'git-gutter:previous-hunk)
(global-set-key (kbd "M-i") 'helm-ls-git-ls)
(global-set-key (kbd "C-g") 'treemacs)
;;(global-set-key (kbd "M-`") 'counsel-evil-marks)
;;(global-set-key (kbd "M-i") 'next-buffer)
;;(global-set-key (kbd "M-o") 'previous-buffer)

;; no eval mode, remap to evil-ex mode
(map! :leader
      :desc "evil ex mode for fast saves" ";" #'evil-ex)


;; golang golang golang golang golang golang golang golang
(add-hook 'before-save-hook 'gofmt-before-save)
(setq gofmt-command "goimports")
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

;; frontend frontend frontend frontend frontend frontend frontend frontend frontend
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

(use-package rjsx-mode
  :mode ("\\.js\\'"
         "\\.jsx\\'")
  :config
  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil
        js2-basic-offset 2
        js-indent-level 2)
  (electric-pair-mode 1))

;; (use-package add-node-modules-path
;;   :defer t
;;   :hook (((js2-mode rjsx-mode) . add-node-modules-path)))

(use-package prettier-js
  :defer t
  :diminish prettier-js-mode
  :hook (((js2-mode rjsx-mode) . prettier-js-mode))
  :init) ; (f)ormat (p)rettier


;; https://github.com/purcell/exec-path-from-shell
;;(when (daemonp)
 ;; (exec-path-from-shell-initialize))

;; tmux
;; (use-package! tmux-pane
;;   :config
;;   (tmux-pane-mode))

;; Show indicators in the left margin
(setq flycheck-indication-mode 'left-margin)

;; open in new window
;;(after! counsel
;;  (ivy-add-actions
;;   'counsel-fzf
;;   '(("j" find-file-other-window "open in other window"))))


;; Adjust margins and fringe widths…
(defun my/set-flycheck-margins ()
  (setq left-fringe-width 8 right-fringe-width 8
        left-margin-width 1 right-margin-width 0)
  (flycheck-refresh-fringes-and-margins))

;; …every time Flycheck is activated in a new buffer
(add-hook 'flycheck-mode-hook #'my/set-flycheck-margins)

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
