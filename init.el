;; line numbers in emacs everywhere

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(global-linum-mode t)

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
 '(package-selected-packages (quote (go-mode zenburn-theme projectile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'zenburn t)
