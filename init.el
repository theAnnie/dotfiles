;; Packages
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Use mouse
(xterm-mouse-mode 1)

;; Theme
(use-package commentary-theme :ensure t)
(load-theme 'commentary t)

;; Show trailing whitespaces
(setq-default show-trailing-whitespace t)

;; Highlight matching parentheses
(show-paren-mode t)

;; Set tab length to 2
(setq-default tab-width 2)


;; Disable dialog-box
(setq use-dialog-box nil)

;;
(menu-bar-mode -1)
(scroll-bar-mode -1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'after-init-hook 'toggle-frame-maximized)
(setq inhibit-startup-screen t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq indent-line-function 'insert-tab)
(electric-indent-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq-default css-indent-offset 2)

;; No emacs poo files
(setq-default create-lockfiles nil)
(setq-default make-backup-files nil)
(setq-default backup-inhibited t)
(setq-default auto-save-default nil)

;; Project navigation
(use-package projectile :ensure t
  :init
  (setq projectile-tags-file-name "tags")
  :config
  (projectile-global-mode))

;; Copy text outside Emacs
(defun copy-from-osx ()
   (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
   (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
         (process-send-string proc text)
         (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; have /bin/bash load in *shell* by default
(setq explicit-shell-file-name "/bin/bash")

;; Keybindings
;; UNMAP UNWANTED KEYBINDINGS
(progn
  (mapcar (lambda(key) (global-unset-key (kbd key)))
          '("<f1>" "<f2>" "<f3>"
            "M-`" "<C-down-mouse-1>"
            ))
  ;; Set custom keybindings
  (mapcar (lambda(key-bind) (global-set-key (kbd (car key-bind))
                                            (cdr key-bind)))
          `(
            ("<f1>" . other-window)
            ("<f2>" . save-buffer)
						("<f3>" . projectile-find-file)
						("C-x C-b" . electric-buffer-list)
            ("C-x C-r" . ffap-other-window)
            )))

;; Elixir
(use-package elixir-mode
  :ensure t
  :hook
  (elixir-mode . (lambda ()
                   (setq column-enforce-column 80)
                   (column-enforce-mode))))
(mapcar (lambda (hook)
          (add-hook hook (lambda ()
                   (setq column-enforce-column 80)
                   (column-enforce-mode 1))))
        '( kotlin-mode-hook java-mode-hook javascript-mode-hook))
;; Other
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rainbow-delimiters find-file-in-project zenburn-theme yaml-mode xclip which-key web-mode visual-fill-column use-package projectile markdown-mode magit graphviz-dot-mode evil erlang elm-mode elixir-mode dumb-jump dracula-theme commentary-theme column-enforce-mode ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
