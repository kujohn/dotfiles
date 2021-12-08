;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;;;
(setq user-full-name "John Ku"
      doom-theme 'doom-material
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

(setq doom-font (font-spec :family "DM Mono" :weight 'Regular))

;;
(setq org-directory "~/org/")
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

;; company / tabnine / lsp
(require 'company-tabnine)
(add-to-list 'company-backends #'company-tabnine)
(setq company-minimum-prefix-length 4
      company-tooltip-limit 10
      company-idle-delay 0.5)
(setq lsp-prefer-capf t)
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setq lsp-idle-delay 0.500)
(setq lsp-on-idle-hook nil)
(setq lsp-log-io nil)
(company-tng-mode t)
(global-company-mode)

;; doom-modeli
(after! doom-modeline
  (doom-modeline-def-modeline 'main
    '(matches buffer-info)
    '(checker major-mode)))

;; yas
(global-yascroll-bar-mode 1)

;; mlscroll
;; (use-package mlscroll
;;   :ensure t
;;   :init
;;   (setq mlscroll-right-align nil)
;;   (add-to-list 'mode-line-misc-info '(:eval (mlscroll-mode-line)) 'append)
;;   (setq mlscroll-width-chars 15)
;;   :config
;;   (mlscroll-mode 1))

;; webmode
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; prescient
(ivy-prescient-mode +1)
(company-prescient-mode +1)
(prescient-persist-mode +1)

;; orderless
(setq completion-styles '(orderless))
(setq ivy-re-builders-alist '((t . orderless-ivy-re-builder)))

;; solaire
(solaire-global-mode +1)

;; git gutter
(global-git-gutter-mode t)

;; tmux pane
(use-package! tmux-pane
  :config
  (tmux-pane-mode))

;; bindings
(global-set-key (kbd "M-g") 'godoc-at-point)
(global-set-key (kbd "M-f") '+ivy/project-search)
(global-set-key (kbd "M-d") '+lookup/definition-otherk-window)
(global-set-key (kbd "M-r") '+lookup/references)

(global-unset-key (kbd "M-k"))
(global-unset-key (kbd "M-j"))
(global-set-key (kbd "M-j") 'git-gutter:next-hunk)
(global-set-key (kbd "M-k") 'git-gutter:previous-hunk) ;

;; avy
(setq avy-all-windows nil)
(global-set-key (kbd "M-a") 'avy-goto-word-0)
(map! :leader "a" 'avy-goto-word-0)

;; fringe marks
(global-evil-fringe-mark-mode)
(map! :leader "s" 'counsel-evil-marks)

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
(use-package prettier-js
  :defer t
  :diminish prettier-js-mode
  :hook (((js2-mode rjsx-mode web-mode typescript-mode) . prettier-js-mode))
  :init)


;; prettier settings
;;(setq prettier-js-args '(
;;  "--trailing-comma" "none"
;;  "--semi" "true"
;;  "--single-quote" "true"
;;  "--bracket-spacing" "true"
;;))

;; flycheck
(setq flycheck-check-syntax-automatically '(save))
(setq flycheck-indication-mode 'left-margin)
(defun my/set-flycheck-margins ()
  (setq left-fringe-width 8 right-fringe-width 8
        left-margin-width 1 right-margin-width 0)
  (flycheck-refresh-fringes-and-margins))
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
