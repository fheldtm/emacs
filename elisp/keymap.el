(use-package general
  :after evil
  :ensure t
  :config
  (general-define-key
    :states 'normal
    "s h" 'windmove-left
    "s j" 'windmove-down
    "s k" 'windmove-up
    "s l" 'windmove-right
    "s v" 'split-window-horizontally
    "s s" 'split-window-vertically
    "; v" 'treemacs-select-window))
