;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Ku"
      doom-theme 'doom-old-hope
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

(setq doom-font (font-spec :family "Operator Mono SSm" :weight 'Book))

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
(setq avy-all-windows t)
(setq mac-command-modifier 'super)

;; disable keyboard yanking
(remove-hook 'tty-setup-hook 'doom-init-clipboard-in-tty-emacs-h)

(setq-default tab-width 2)
(setq tab-width 2)
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

;; company / tabnine
(require 'company-tabnine)
(add-to-list 'company-backends #'company-tabnine)
(setq company-minimum-prefix-length 4
      company-tooltip-limit 15
      company-idle-delay 0.05)
(setq lsp-prefer-capf t)
(company-tng-mode t)
(global-company-mode)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

;; lsp improvements
(setq gc-cons-threshold 100000000)
(setq lsp-idle-delay 0.500)
(setq read-process-output-max (* 1024 1024))
(setq lsp-log-io nil)

;; doom-modeline
(setq doom-modeline-buffer-encoding nil)
(setq doom-modeline-indent-info nil)
(setq doom-modeline-checker-simple-format t)
(setq doom-modeline-workspace-name nil)
(setq doom-modeline-persp-name nil)
(setq doom-modeline-lsp nil)


;; prescient
(ivy-prescient-mode +1)
(company-prescient-mode +1)
(prescient-persist-mode +1)

;; orderless
(setq completion-styles '(orderless))
(setq ivy-re-builders-alist '((t . orderless-ivy-re-builder)))

;; doom modeline
(require 'doom-modeline)
(doom-modeline-mode 1)

;; solaire
(solaire-global-mode +1)

;; git gutter
(global-git-gutter-mode t)

;; look up
(global-set-key (kbd "M-s") '+ivy/project-search)
(global-set-key (kbd "M-p") 'avy-goto-word-0)
(global-set-key (kbd "M-i") 'avy-goto-line)
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
(global-set-key (kbd "M-c") 'lsp-rename)

(global-set-key (kbd "C-s") 'treemacs)
(global-set-key (kbd "C-g") 'treemacs-select-window)
;; no eval mode, remap to evil-ex mode
(map! :leader
      :desc "evil ex mode for fast saves" ";" #'evil-ex)


;; golang golang golang golang golang golang golang golang
(add-hook 'before-save-hook 'gofmt-before-save)
(setq gofmt-command "goimports")
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

(use-package rjsx-mode
  :mode ("\\.js\\'"
         "\\.jsx\\'"
         "\\.ts\\'"
         "\\.tsx\\'")
  :config
  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil
        js2-basic-offset 2
        js-indent-level 2)
  (electric-pair-mode 1))

(use-package prettier-js
  :defer t
  :diminish prettier-js-mode
  :hook (((js2-mode rjsx-mode) . prettier-js-mode))
  :init) ; (f)ormat (p)rettier

;; prettier settings
;;(setq prettier-js-args '(
;;  "--trailing-comma" "none"
;;  "--semi" "true"
;;  "--single-quote" "true"
;;  "--bracket-spacing" "true"
;;))

;; flycheck
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(setq flycheck-indication-mode 'left-margin)
(defun my/set-flycheck-margins ()
  (setq left-fringe-width 8 right-fringe-width 8
        left-margin-width 1 right-margin-width 0)
  (flycheck-refresh-fringes-and-margins))
(add-hook 'flycheck-mode-hook #'my/set-flycheck-margins)
(global-flycheck-mode t)

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
