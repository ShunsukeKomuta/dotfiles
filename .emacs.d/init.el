(setq auto-save-default nil)
(setq make-backup-files nil)
(setq-default tab-width 4 indent-tabs-mode nil)

(show-paren-mode t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'material t)
