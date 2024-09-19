;; evil
(use-package evil
  :ensure t
  :demand t
  :init
  (setq evil-undo-system 'undo-redo)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (evil-define-key 'insert 'evil-insert-state-map (kbd "C-c") 'evil-force-normal-state)
  (define-key evil-normal-state-map (kbd "s") nil))

;; ivy
(use-package ivy
  :ensure t
  :demand
  :bind
  (("C-s" . swiper)
   ("M-x" . counsel-M-x))
  :config
  (ivy-mode 1))

;; Counsel 설치 및 설정
(use-package counsel
  :after ivy
  :ensure t)

;; Swiper 설치 및 설정
(use-package swiper
  :after ivy
  :ensure t)

;; dashboard package 설정
(use-package dashboard
  :ensure t
  :config
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (dashboard-setup-startup-hook))

(use-package winum
  :ensure t
  :init
  (setq winum-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "C-`") 'winum-select-window-by-number)
      (define-key map (kbd "C-1") 'winum-select-window-1)
      (define-key map (kbd "C-2") 'winum-select-window-2)
      (define-key map (kbd "C-3") 'winum-select-window-3)
      (define-key map (kbd "C-4") 'winum-select-window-4)
      (define-key map (kbd "C-5") 'winum-select-window-5)
      (define-key map (kbd "C-6") 'winum-select-window-6)
      (define-key map (kbd "C-7") 'winum-select-window-7)
      (define-key map (kbd "C-8") 'winum-select-window-8)
      (define-key map (kbd "C-9") 'winum-select-window-9)
      map))
  :config
  (winum-mode))

;; magit
(use-package transient
  :ensure t)
(use-package magit
  :after transient
  :ensure t)

;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode 1))

;; <C-x>, <C-c>, <C-v> to Copy, Cut, Paste
(cua-mode 1)

(load-file "~/.emacs.d/elisp/treemacs.el")
(load-file "~/.emacs.d/elisp/lsp.el")
