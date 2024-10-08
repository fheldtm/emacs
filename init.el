;; (load-file "~/.emacs.d/elisp/options.el")
;; (load-file "~/.emacs.d/elisp/packages.el")
;; (load-file "~/.emacs.d/elisp/keymap.el")

;; Emacs는 기본으로 CJK (한중일) 문자를 인코딩하지만, 이로 인해 유니코드 환경에서는 문제가 발생합니다. 이 옵션은 꺼주는 것이 좋습니다.
(setq utf-translate-cjk-mode nil) 

;; utf-8 config
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8-mac) ;; For old Carbon emacs on OS X only
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
;; 윈도우 환경에서는 모든 텍스트가 UTF-8로 인코딩되지 않으므로, 클립보드 인코딩을 UTF-8로 하지 않습니다.
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)

(org-babel-load-file "~/.emacs.d/config.org")
