;; theme
;; (use-package dracula-theme
;;   :ensure t
;;   :demand t
;;   :config (load-theme 'dracula t))

;; (use-package atom-one-dark-theme
;;   :ensure t
;;   :demand t
;;   :config (load-theme 'atom-one-dark t))

(use-package catppuccin-theme
  :ensure t
  :demand t
  ;; :init (setq catppuccin-flavor 'frappe)
  :init (setq catppuccin-flavor 'mocha)
  :config (load-theme 'catppuccin t))

;; (use-package zenburn-theme
;;   :ensure t
;;   :config (load-theme 'zenburn t))
