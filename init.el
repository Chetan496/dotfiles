;; set proxy for windows machine
;; you will need to use use the M-x proxy-activate command everytime before downloading new packages.
(defun proxy-activate ()
  (interactive)

  (let ((proxy "dummyProxy:portNum") (credentials "DOMAIN\Username:pwd"))
    (setq url-proxy-services
      `(("no_proxy" . "^\\(localhost\\|10.*\\)")
       ("http" . ,proxy)
       ("https" . ,proxy)))

    (setq url-http-proxy-basic-auth-storage
      (list (list proxy
                (cons "Input your LDAP UID !"
                      (base64-encode-string credentials)))))))

(provide 'proxy-activate)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Package repos.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/"))

(package-initialize)

;; line numbers in emacs everywhere
(global-linum-mode t)

(set-face-attribute 'default nil :font "Consolas-12")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; paredit-everywhere
(add-hook 'prog-mode-hook 'paredit-everywhere-mode)
(add-hook 'text-mode-hook 'paredit-everywhere-mode)


;;;;;;;;;;;;;;;;;;;;;;;
;; paredit for lisp like buffers
 (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
 (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
 (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
 (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
 (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
 (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
 (add-hook 'scheme-mode-hook           #'enable-paredit-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Emacs appearance
;; Disable start splash screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

;; use the Monokai theme
(load-theme 'monokai t)

;; set cursor type
(setq cursor-type '(bar . 2))

;;hide toolbar
(tool-bar-mode -1)

;;set initial frame size
(when window-system (set-frame-size (selected-frame) 110 42))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Enable RecentF mode

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
