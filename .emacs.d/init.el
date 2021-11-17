;;----------------Visuals------------------;;
(set-face-attribute 'default nil :family "Roboto Mono")

(setq-default line-spacing 3)
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

;;----------------Gauche------------------;;
(modify-coding-system-alist 'process' "gosh" '(utf-8 . utf-8))
(setq scheme-program-name "gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

(define-key global-map
  "\C-cs" 'scheme-other-window)
