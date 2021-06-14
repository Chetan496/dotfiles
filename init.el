;; line numbers in emacs everywhere
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



