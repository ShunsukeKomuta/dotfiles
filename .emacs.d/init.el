;;----------------Visuals------------------;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'material t)

(set-face-attribute 'default nil :family "Fira Code" :height 130)
(set-fontset-font t 'japanese-jisx0208 (font-spec :family "Fira Code"))

(setq-default line-spacing 11)
(tool-bar-mode -1)
(setq inhibit-startup-message t)

;;----------------Settings-----------------;;
(show-paren-mode t)
(setq-default tab-width 4 indent-tabs-mode nil)
(setq auto-save-default nil)
(setq make-backup-files nil)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 1000)

(icomplete-mode 1)

(add-hook 'slim-mode-hook '(lambda ()
                             (electric-indent-local-mode -1)))

;;----------------Keybindings---------------;;
(global-set-key (kbd "C-h") 'delete-backward-char)

;;----------------Manual Install------------;;
(add-to-list 'load-path "~/.emacs.d/elisp")

;;/
;;/Smart Compile
;;/
(require 'smart-compile)
(global-set-key (kbd "C-c c") 'smart-compile)
(global-set-key (kbd "C-c C-c") (kbd "C-c c C-m"))
(setq compilation-window-height 15)

;;/
;;/Anything
;;/
(add-to-list 'load-path "~/.emacs.d/elisp/anything-config")
(require 'anything-config)
(define-key global-map (kbd "C-;") 'anything)
(setq anything-input-idle-delay 0.1)

;;----------------Package Install------------;;
(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)

;;/
;;/Company-Mode
;;/
(require 'company)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 3)
(setq company-selection-wrap-around t)
(global-company-mode)

;;/
;;/Scala
;;/
(add-to-list 'load-path "~/.emacs.d/elisp/scala-mode2")
(require 'scala-mode2)
; (require 'ensime)
