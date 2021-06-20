;; numbers in emacs everywhere

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(global-linum-mode t)

;;so that you can see matching params
(show-paren-mode 1)
;;;;;;;;;;;;;;;;;;;;; Emacs appearance
;; Disable start splash screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

(set-face-attribute 'default nil :height 160)

;; set cursor type
(setq cursor-type '(bar . 2))

;;hide toolbar
(tool-bar-mode -1)


(add-hook 'window-setup-hook 'toggle-frame-maximized t)

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (treemacs project paredit go-mode zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'zenburn t)

;; paredit config
 (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
 (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
 (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
 (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
 (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
 (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
 (add-hook 'scheme-mode-hook           #'enable-paredit-mode)




