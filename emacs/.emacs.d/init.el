;; sparkhom emacs config

;; Set custom file and load for override
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'no-error 'no-message)

;;
;; Packages
;;

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Managing packages with use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Themes

(use-package solarized-theme
  :config
  (load-theme 'solarized-light t))

;; Evil

(use-package evil
  :config
  (evil-mode t))
(use-package evil-nerd-commenter)
(use-package evil-leader
  :config
  (global-evil-leader-mode)
  (evil-leader/set-key
    "f" 'find-file
    "c" (lambda () (interactive) (find-file "~/.emacs.d/init.el"))
    ))

;; Ivy - Completion

(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t)
  (ivy-mode t))
(use-package counsel)
(use-package ivy-rich
  :config
  (setq ivy-rich-path-style 'abbrev)
  (ivy-rich-mode t))
(use-package ivy-prescient
  :config
  (ivy-prescient-mode t))

;; Which-key - Help on which keys to press

(use-package which-key
  :config
  (which-key-mode))

;; Smartparens - Autoinsert paren pairs

(use-package smartparens
  :config
  (add-hook 'prog-mode-hook #'smartparens-mode))

;; Rainbow paren highlighting

(use-package rainbow-mode
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode))
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Company - more syntax hilighting

(use-package company
  :config
  (global-company-mode t))
(use-package company-prescient
  :config
  (company-prescient-mode t))

;;
;; Settings
;;

;; Disable startup screen
(setq inhibit-startup-screen t
      initial-scratch-message nil)

;; Disable cursor blinking
(blink-cursor-mode 0)

;; Disable unneeded GUI features
(menu-bar-mode -1)
(tool-bar-mode -1)
(mouse-wheel-mode -1)

;; show column number
(column-number-mode t)

;; show line number
(global-linum-mode t)
