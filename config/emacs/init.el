;; init.el



;; PACKAGE MANAGEMENT
;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Refresh package contents if needed
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if it's not installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)



;; THEMING
;; Dracula theme
(use-package dracula-theme
  :config
  (load-theme 'dracula t))

;; Set default background and foreground to match Dracula
(set-background-color "#282a36")
(set-foreground-color "#f8f8f2")



;; BASIC UI IMPROVEMENTS
;; Disable the startup message
(setq inhibit-startup-message t)

;; Disable toolbar, menu bar, and scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Show line numbers globally
(global-display-line-numbers-mode t)

;; Highlight the line where the cursor is
(global-hl-line-mode t)

;; Use 'y' or 'n' instead of 'yes' or 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; Change default font (adjust size to your preference)
;; (set-face-attribute 'default nil :font "Fira Code-12")



;; EDITOR BEHAVIOR FOR PROGRAMMING
;; Highlight matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)  ;; Highlight immediately
(setq show-paren-style 'parenthesis) ;; Only highlight matching parens

;; Auto-completion
;;(use-package company
;;  :hook (after-init . global-company-mode)
;;  :config
;;  (setq company-minimum-prefix-length 1
;;        company-idle-delay 0.0)) ;; show suggestions immediately

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default standard-indent 4)

;; Enable syntax highlighting globally
(global-font-lock-mode 1)

;; Show line numbers only in prog-mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)



;;UTILITIES
;; Show available keybindings
(use-package which-key
  :defer 0
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5)) ;; show suggestions after 0.5s

;; Git interface
(use-package magit
  :bind (("C-x g" . magit-status)))

;; Project navigation
(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode)
  (setq projectile-completion-system 'auto)
  :bind-keymap
  ("C-c p" . projectile-command-map))




;; ;; Treemacs - file explorer
(use-package treemacs
  :defer t
  :config
  (setq treemacs-width 30))  ;; sidebar width

;; Treemacs with icons
(use-package treemacs-icons-dired
  :after (treemacs dired)
  :hook (dired-mode . treemacs-icons-dired-mode))

;; Optional: integrate with projectile for projects
(use-package treemacs-projectile
  :after (treemacs projectile)
  :config
  (treemacs-projectile))

;; Open/close Treemacs
(global-set-key (kbd "C-x t t") 'treemacs)  ;; toggle sidebar
(global-set-key (kbd "C-x t d") 'treemacs-select-directory)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
