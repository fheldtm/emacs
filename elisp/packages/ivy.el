;; ivy
(use-package ivy
  :ensure t
  :demand
  :bind
  (("C-s" . swiper)
   ("M-x" . counsel-M-x))
  :config
  (ivy-mode 1))