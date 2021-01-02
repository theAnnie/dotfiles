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

;; Theme
(use-package commentary-theme :ensure t)
(load-theme 'commentary t)

;; Show trailing whitespaces
(setq-default show-trailing-whitespace t)

;; Project navigation
(use-package find-file-in-project :ensure t)

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
	    ("<f3>" . find-file-in-project)
            )))

;; Elixir
(use-package elixir-mode
  :ensure t
  :hook
  (elixir-mode . (lambda ()
                   (setq column-enforce-column 80)
                   (column-enforce-mode))))

;; Other
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f66625cc7265a5c013962fe216619fa6bf3bd6ba762a52d3a1bcf48d18dce382" default))
 '(package-selected-packages '(elixir-mode use-package commentary-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
