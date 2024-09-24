;; TypeScript & JavaScript LSP 설정
;; (use-package typescript-mode
;;   :ensure t
;;   :mode "\\.ts\\'"
;;   :hook (typescript-mode . lsp-deferred))
;; (use-package js2-mode
;;   :ensure t
;;   :mode "\\.js\\'"
;;   :interpreter "node"
;;   :hook (js2-mode . lsp-deferred))

;; (use-package lv
;;   :ensure t)

(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0.1)  ;; 자동 완성 대기 시간
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

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package dap-mode
  :ensure t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package tree-sitter
  :ensure t)

(use-package tree-sitter-langs
  :ensure t)

;; Flycheck (코드 검사 및 경고)
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
