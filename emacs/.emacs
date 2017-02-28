(require 'package)
(package-initialize)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("gnu" . "http://mirrors.163.com/elpa/gnu/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq scroll-step 1 scroll-conservatively 10000)

;; split vertically ffs
(setq split-height-threshold nil)
(setq split-width-threshold 0)

(use-package base16-theme :ensure t)
;; (use-package cyberpunk-2019-theme :ensure t)
(use-package bash-completion :ensure t)
(use-package company
  :ensure t
  :init
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (setq company-tooltip-align-annotations t)
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 1)))
(use-package company-tern :ensure t
  :init
  (progn
    (add-to-list 'company-backends 'company-tern)
    ;; (setq company-tern-property-marker nil)
    ))
(use-package counsel :ensure t)
(use-package editorconfig :ensure t)
(use-package evil :ensure t)
(use-package ido-vertical-mode :ensure t)
(use-package haskell-mode :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-haskell :ensure t)

(use-package flycheck :ensure t
  :init (progn
	  (setq flycheck-idle-change-delay 0)
	  (setq flycheck-display-errors-delay 0.0)
	  ;; (set-face-attribute 'flycheck-error nil :underline '(:color "#FF4081"))
	  ;; (set-face-attribute 'flycheck-warning nil :underline '(:color "#FF9C00"))
	  ;; (set-face-attribute 'flycheck-info nil :underline '(:color "#9C00FF"))
	  )
  :config (add-hook 'json-mode-hook #'flycheck-mode))
(use-package flycheck-yamllint :ensure t)

(use-package json-mode :ensure t)
; (use-package paredit :ensure t)
(use-package lispy :ensure t)
(use-package magit :ensure t)
(use-package markdown-mode :ensure t :mode "\\.md\\'")
;; (use-package paren :ensure t :init (setq show-paren-delay 0))
;; (use-package projectile
;;   :ensure t
;;   :init (progn
;;           (projectile-mode 1)
;;           (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;           (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)))
;; (use-package pug-mode :ensure t)
;; (use-package shell-here :ensure t)
;; (use-package stylus-mode :ensure t)
(use-package swiper
  :ensure t
  :config (progn
            (ivy-mode 1)
            (setq ivy-use-virtual-buffers t)
            (setq enable-recursive-minibuffers t)
            (global-set-key "\C-s" 'swiper)
            (global-set-key (kbd "C-c C-r") 'ivy-resume)
            (global-set-key (kbd "<f6>") 'ivy-resume)
            (global-set-key (kbd "M-x") 'counsel-M-x)
            (global-set-key (kbd "C-x C-f") 'counsel-find-file)
            (global-set-key (kbd "<f1> f") 'counsel-describe-function)
            (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
            (global-set-key (kbd "<f1> l") 'counsel-find-library)
            (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
            (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
            (global-set-key (kbd "C-c g") 'counsel-git)
            (global-set-key (kbd "C-c j") 'counsel-git-grep)
            (global-set-key (kbd "C-c k") 'counsel-ag)
            (global-set-key (kbd "C-x l") 'counsel-locate)
            (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
            (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)))

(use-package which-key
  :ensure t
  :init
  (setq which-key-idle-delay 0.5)
  :config
  (which-key-mode))

;; -----------------
;; CONFIG :: C#
;; -----------------
(use-package csharp-mode :ensure t)
(use-package omnisharp :ensure t)

(add-hook 'csharp-mode-hook 'omnisharp-mode)
(eval-after-load
 'company
 '(add-to-list 'company-backends 'company-omnisharp))

(add-hook 'csharp-mode-hook #'company-mode)
(add-hook 'csharp-mode-hook #'flycheck-mode)

;; ---------------------
;; CONFIG :: JAVASCRIPT
;; ---------------------
;; (add-hook 'javascript-mode-hook 'flycheck-mode)
;; (flycheck-add-next-checker 'javascript-flow 'javascript-flow-coverage)
;; (add-hook 'js2-mode-hook 'flow-minor-enable-automatically)
;; (add-hook 'js2-mode-hook 'flow-minor-mode)
;; (add-hook 'js2-mode-hook 'eslintd-fix-mode)
;; (add-hook 'js2-mode-hook 'evil-mode)
;; (with-eval-after-load 'flycheck
;;   (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
;;   (flycheck-add-mode 'javascript-eslint 'flow-minor-mode)
;;  (flycheck-add-next-checker 'javascript-flow 'javascript-eslint))

;; -----------------
;; CONFIG :: RUST
;; -----------------
(use-package rust-mode :ensure t)
(use-package flycheck-rust :ensure t)
(use-package racer :ensure t)
(use-package cargo :ensure t)

;(add-hook 'rust-mode-hook)
;(add-hook 'racer-mode-hook)
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; -----------------
;; CONFIG :: LISP
;; -----------------
(use-package sly :ensure t)
(setf inferior-lisp-program "/usr/local/bin/sbcl --dynamic-space-size 4096 --control-stack-size 4")

(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
(add-hook 'sly-mode-hook (lambda () (lispy-mode 1)))

;; -----------------------
;; GENERAL EDITOR CONFIGURATION
;; -----------------------
(tool-bar-mode 0)
(menu-bar-mode 0)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(fringe-mode 0)
(global-hl-line-mode 1)
;; (fringe-mode '(nil . 0))
(linum-mode 1)
(show-paren-mode 1)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
;; (set-face-attribute 'default t :)

;; (set-default-font "Ubuntu Mono 14")
;; (setq-default mode-line-format nil)
;; (add-to-list 'default-frame-alist '(font . "Ubuntu 15"))


(set-frame-font "GohuFont Powerline 11" nil t)
(setq display-line-numbers 'relative)
(global-display-line-numbers-mode 1)
;; (evil-mode 1)
;; (ido-mode 1)
;; (ido-vertical-mode 1)
;; (windmove-default-keybindings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1d2021" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#83a598" "#d5c4a1"])
 '(ansi-term-color-vector
   [unspecified "#28211c" "#cf6a4c" "#54be0d" "#f9ee98" "#5ea6ea" "#9b859d" "#5ea6ea" "#8a8986"] t)
 '(blink-cursor-mode nil)
 '(custom-safe-themes
   (quote
    ("3e34e9bf818cf6301fcabae2005bba8e61b1caba97d95509c8da78cff5f2ec8e" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "50d07ab55e2b5322b2a8b13bc15ddf76d7f5985268833762c500a90e2a09e7aa" "725a0ac226fc6a7372074c8924c18394448bb011916c05a87518ad4563738668")))
 '(flow-minor-stop-server-on-exit nil)
 '(ido-enable-flex-matching t)
 '(overflow-newline-into-fringe nil)
 '(package-selected-packages
   (quote
    (eslintd-fix company-tern rust-mode lsp-haskell company-lsp haskell-mode docker docker-compose-mode format-sql cyberpunk-2019-theme gotham-theme hamlet-mode merlin-eldoc flycheck-haskell intero scribble-mode folding lsp-typescript lsp-mode multiple-cursors exec-path-from-shell keychain-environment fzf sly-repl-ansi-color smart-tabs-mode which-key vue-mode stylus-mode pug-mode projectile markdown-mode magit lispy js2-mode json-mode flow-minor-mode flycheck-yamllint flycheck-flow ido-vertical-mode evil editorconfig counsel company bash-completion use-package)))
 '(standard-indent 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

					; (global-unset-key "M-h")
(global-unset-key (kbd "M-j"))
(global-unset-key (kbd "M-k"))
(global-unset-key (kbd "M-k"))
(global-unset-key (kbd "C-x C-s"))
(global-unset-key (kbd "C-x C-s"))
(global-unset-key (kbd "<insert>"))
(global-unset-key (kbd "<insertchar>"))
;; (global-unset-key (kbd "ESC"))

(global-set-key (kbd "C-f") 'swiper)
(global-set-key (kbd "C-s") 'save-buffer)

; (global-unset-key (kbd "C-x C-f"))
; (global-set-key (kbd "C-x F") 'counsel-find-file)

;; (setq tab-width 3)
;; (setq indent-tabs-mode nil)

(load-theme 'base16-atelier-estuary t)

;; (load-theme 'cyberpunk-2019 t)

;; (load-theme 'base16-gruvbox-dark-hard t)
