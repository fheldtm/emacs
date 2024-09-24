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
  (winum-mode 1))