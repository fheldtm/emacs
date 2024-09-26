(use-package atom-one-dark-theme
  :ensure t
  :demand t
  :config (load-theme 'atom-one-dark t))

(use-package catppuccin-theme
  :ensure t
  :demand t
  ;; :init (setq catppuccin-flavor 'frappe)
  :init (setq catppuccin-flavor 'mocha))

(use-package zenburn-theme
  :ensure t)
