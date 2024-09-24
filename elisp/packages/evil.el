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