;; magit
(use-package magit
  :after transient
  :init
  (setq magit-auto-revert-mode nil)
  :ensure t)