(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0.0)  ;; 자동 완성 대기 시간
  (setq company-minimum-prefix-length 1)  ;; 최소 입력 길이
  :config
  (global-company-mode 1)
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (define-key company-active-map (kbd "<tab>") 'company-complete))

  ;; company-lsp 추가
  (use-package company-lsp
    :ensure t
    :config
    (setq company-backends (delete 'company-semantic company-backends)) ;; semantic 백엔드 제거
    (add-to-list 'company-backends 'company-lsp)) ;; lsp 백엔드 추가

  ;; company-box 추가
  (use-package company-box
    :ensure t
    :hook (company-mode . company-box-mode)
    :config
    (company-box-mode 1)))

(use-package js-ts-mode
  :ensure t
  :hook (js-ts-mode . eglot-ensure)
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\" . js-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.ts\\" . js-ts-mode)))

;; Flycheck (코드 검사 및 경고)
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
