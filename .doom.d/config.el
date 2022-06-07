;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Ku"
      user-mail-address "hellojohnku@gmail.com")

(setq doom-theme 'doom-monokai-pro)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq mac-command-modifier 'super)
(set-face-attribute 'default nil :font "PragmataPro Liga")

(remove-hook 'tty-setup-hook 'doom-init-clipboard-in-tty-emacs-h)

(setq-default tab-width 2)
(setq tab-width 2)

;; company / tabnine / lsp
(company-tng-mode t)
(add-to-list 'company-backends #'company-tabnine)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-show-numbers t)
(setq company-idle-delay 0)
(setq gc-cons-threshold 100000000)
(setq lsp-prefer-capf t)
(setq read-process-output-max (* 1024 1024))
(setq lsp-on-idle-hook nil)
(setq lsp-log-io nil)

;; doom-modeli
(after! doom-modeline
  (doom-modeline-def-modeline 'main
    '(matches buffer-info)
    '(checker major-mode)))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; dumb-jump
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; prescient
(company-prescient-mode +1)

;; avy
(setq avy-all-windows nil)
(global-set-key (kbd "M-a") 'avy-goto-word-0)
(map! :leader "f" 'avy-goto-word-0)
(map! :leader "d" 'avy-goto-line)

;; orderless
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; git gutter
(global-git-gutter-mode t)

;; tmux pane
(tmux-pane-mode +1)

;; bindings
(global-set-key (kbd "M-g") 'godoc-at-point)
(global-set-key (kbd "M-f") '+vertico/project-search)
(global-set-key (kbd "M-d") '+lookup/documentation)
(global-set-key (kbd "M-r") '+lookup/references)
(global-set-key (kbd "M-g") 'dash-at-point)
(global-set-key (kbd "M-TAB") 'company-complete-selection)

(global-unset-key (kbd "M-k"))
(global-unset-key (kbd "M-j"))
(global-set-key (kbd "M-j") 'flycheck-next-error)
(global-set-key (kbd "M-k") 'flycheck-previous-error) ;

;; fringe marks
;; (global-evil-fringe-mark-mode)
;; (map! :leader "s" 'counsel-evil-marks)

;; buffer, windows, workspaces
(global-set-key (kbd "C-h") 'evil-window-left)
(global-set-key (kbd "C-l") 'evil-window-right)
(global-set-key (kbd "C-j") 'evil-window-down)
(global-set-key (kbd "C-k") 'evil-window-up)
(global-set-key (kbd "M-h") '+workspace/switch-left)
(global-set-key (kbd "M-l") '+workspace/switch-right)

;; tree macs
(global-set-key (kbd "C-s") 'treemacs)
(global-set-key (kbd "C-g") 'treemacs-select-window)

;; flycheck
(map! :leader "l" 'flycheck-list-errors)

;; misc
(map! :leader "r" 'lsp-rename)


;; no eval mode, remap to evil-ex mode
(map! :leader
      :desc "evil ex mode for fast saves" ";" #'evil-ex)

;; golang
(add-hook 'before-save-hook 'gofmt-before-save)
(setq gofmt-command "goimports")
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

;; rjsx
(use-package rjsx-mode
  :config
  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil
        js2-basic-offset 2
        js-indent-level 2)
  (electric-pair-mode 1))

;; prettier
(add-hook 'tsx-mode-hook 'prettier-js-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)
(add-hook 'typescript-tsx-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)

;; flycheck
(global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(save))
(setq flycheck-indication-mode 'left-margin)
(defun my/set-flycheck-margins ()
  (setq left-fringe-width 8 right-fringe-width 8
        left-margin-width 1 right-margin-width 0)
  (flycheck-refresh-fringes-and-margins))
(add-hook 'flycheck-mode-hook #'my/set-flycheck-margins)
(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
              (display-buffer-reuse-window
               display-buffer-in-side-window)
              (side            . bottom)
              (reusable-frames . visible)
              (window-height   . 0.15)))


;; tsx-mode
(straight-use-package '(tsi :type git :host github :repo "orzechowskid/tsi.el"))
(straight-use-package '(tsx-mode :type git :host github :repo "orzechowskid/tsx-mode.el"))

;; treesitter
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . tsx-mode))


;; origami
(require 'origami)
