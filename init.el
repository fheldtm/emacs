;; ---------------------- default config ----------------------

;; Set the default encoding as UTF-8
(set-language-environment "utf-8")

;; UI 간결화 (메뉴바, 툴바, 스크롤바 제거)
(menu-bar-mode -1)      ;; 메뉴바 비활성화
(tool-bar-mode -1)      ;; 툴바 비활성화
(scroll-bar-mode -1)    ;; 스크롤바 비활성화
(tooltip-mode -1)       ;; 툴팁 비활성화
(set-fringe-mode 10)    ;; 기본 프린지(가장자리 여백) 설정

;; 라인 번호 표시
(global-display-line-numbers-mode t)

;; 기본 폰트 설정
(set-face-attribute 'default nil :font "Fira Code" :height 100)

;; 특정 모드에서는 라인 번호를 비활성화
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; 백업 및 자동 저장 파일 비활성화
(setq make-backup-files nil)    ;; 백업 파일 생성 방지
(setq auto-save-default nil)    ;; 자동 저장 방지

;; ---------------------- elpaca package manager ----------------------
(defvar elpaca-installer-version 0.7)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                 ,@(when-let ((depth (plist-get order :depth)))
                                                     (list (format "--depth=%d" depth) "--no-single-branch"))
                                                 ,(plist-get order :repo) ,repo))))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Uncomment for systems which cannot create symlinks:
(elpaca-no-symlink-mode)

;; Install a package via the elpaca macro
;; See the "recipes" section of the manual for more details.

;; (elpaca example-package)

;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable use-package :ensure support for Elpaca.
  (elpaca-use-package-mode))

;; start the initial frame maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; start every frame maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; (set-background-color "#ff0000")
;; (set-frame-parameter nil 'bg-image-enable-flag t)
;; (set-frame-parameter nil 'bg-fill-alpha 0.6)
;; (set-frame-parameter nil 'bg-image-filename "~/.config/wallpaper/wallpaper-02.png")

;; theme
(use-package dracula-theme
             :ensure t
             :demand t
             :config (load-theme 'dracula t))

;; evil
(use-package evil
             :ensure t
             :demand t
             :config (evil-mode 1))

;; ivy
(use-package ivy
             :ensure t
             :demand
             :bind (("C-s" . swiper)
                    ("M-x" . counsel-M-x)
                    ("C-x b" . counsel-ibuffer)
                    ("C-x C-f" . counsel-find-file))
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
