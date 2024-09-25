;; Emacs는 기본으로 CJK (한중일) 문자를 인코딩하지만, 이로 인해 유니코드 환경에서는 문제가 발생합니다. 이 옵션은 꺼주는 것이 좋습니다.
(setq utf-translate-cjk-mode nil) 

;; UTF-8 설정 모음
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8-mac) ;; For old Carbon emacs on OS X only
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
;; 윈도우 환경에서는 모든 텍스트가 UTF-8로 인코딩되지 않으므로, 클립보드 인코딩을 UTF-8로 하지 않습니다.
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)

;; 시간 표시 형식은 영어로 표시해서 호환성을 높입니다.
(setq system-time-locale "C")

;; 모드 라인에 2018-06-03 16:06 형식으로 시간을 표시합니다.
(setq display-time-format "[%Y-%m-%d %H:%M]")
(display-time-mode 1)

;; 라인 번호 표시
(global-display-line-numbers-mode t)
;; relative 라인 번호
(setq display-line-numbers-type 'relative)

;; 기본 폰트 설정
(set-face-attribute 'default nil :font "Fira Code" :height 100)
(if (eq system-type 'darwin)
  (set-face-attribute 'default nil :font "Fira Code" :height 140)
)

;; 특정 모드에서는 라인 번호를 비활성화
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; 백업 및 자동 저장 파일 비활성화
(setq make-backup-files nil)    ;; 백업 파일 생성 방지
(setq auto-save-default nil)    ;; 자동 저장 방지
(setq create-lockfiles nil)     ;; Lock 파일 생성 방지

;; desktop 화면 크기 및 위치를 종료시 위치로 기억하기
(desktop-save-mode 1)

;; start the initial frame maximized
;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; start every frame maximized
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; ElDoc Mode 완전 비활성화
(global-eldoc-mode -1)

;; 특정 모드에서도 eldoc-mode가 자동으로 켜지지 않도록 하기
(advice-add 'eldoc-mode :override #'ignore)


;; indent space 2
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
