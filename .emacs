(setq default-directory "~/")
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

(prefer-coding-system 'utf-8-unix)
(setq-default indent-tabs-mode nil)
(setq-default require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq auto-save-default nil)
(setq disabled-command-function nil)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'text-mode)
(setq make-backup-files nil)
(setq-default ring-bell-function 'ignore)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(blink-cursor-mode 0)
(column-number-mode 1)
(global-hl-line-mode 1)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

(when (member "Liberation Mono" (font-family-list))
  (set-face-attribute 'default nil :font "Liberation Mono-11"))

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package restart-emacs
  :ensure t)

(use-package ido
  :config
  (use-package ido-completing-read+
    :ensure t)
  (use-package ido-vertical-mode
    :ensure t
    :config
    (setq ido-vertical-define-keys 'C-n-and-C-p-only))
  (ido-mode 1)
  (ido-vertical-mode 1)
  (ido-ubiquitous-mode 1))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (use-package undo-tree
    :diminish "")
  (use-package evil-escape
    :ensure t
    :diminish "")
  (use-package evil-leader
    :ensure t
    :config
    (setq evil-leader/in-all-states t)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
     "b" 'switch-to-buffer
     "c" 'comment-or-uncomment-region
     "d" 'delete-other-windows
     "e" (lambda ()
            (interactive)
            (find-file-existing "~/.emacs"))
     "f" 'find-file
     "k" 'kill-this-buffer
     "n" (lambda ()
            (interactive)
            (find-file-existing "~/Documents/n"))
     "o" 'other-window
     "q" 'save-buffers-kill-terminal
     "r" 'restart-emacs
     "s" 'save-buffer
     "hf" 'describe-function
     "hv" 'describe-variable
     "<tab>" (lambda ()
               (interactive)
               (switch-to-buffer (other-buffer (current-buffer) 1)))
     "<SPC>" 'execute-extended-command))
  (global-evil-leader-mode 1)
  (evil-mode 1)
  (evil-escape-mode 1))

(use-package web-mode
  :ensure t
  :mode "\\.html\\'"
  :init
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook (lambda ()
                             (setq web-mode-markup-indent-offset 2)
                             (setq web-mode-css-indent-offset 2)
                             (setq web-mode-code-indent-offset 2)
                             (setq web-mode-style-padding 2)
                             (setq web-mode-script-padding 2)
                             (setq evil-shift-width 2))))

(use-package css-mode
  :mode "\\.css\\'"
  :init
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook (lambda ()
                             (setq css-indent-offset 2)
                             (setq evil-shift-width 2))))

(use-package emmet-mode
  :ensure t
  :bind (:map emmet-mode-keymap
              ("<tab>" . emmet-expand-line))
  :config
  (setq emmet-self-closing-tag-style ""))

(use-package js-mode
  :mode "\\.js\\'"
  :init
  (add-hook 'js-mode-hook (lambda ()
                            (setq js-indent-level 2)
                            (setq evil-shift-width 2))))

(use-package graphene-meta-theme
  :ensure t)

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (load-theme 'sanityinc-tomorrow-night t)
  (load-theme 'graphene-meta t))
