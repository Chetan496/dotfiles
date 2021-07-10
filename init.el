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
(setq cursor-type '(bar . 1))

;;hide toolbar
(tool-bar-mode -1)

;;word wrap settings text mode
(add-hook 'text-mode-hook '(lambda ()
    (setq truncate-lines nil
          word-wrap t
	  visual-line-mode t)))

;;word wrap settings prog mode
(add-hook 'prog-mode-hook '(lambda ()
    (setq truncate-lines t
          word-wrap nil
	  visual-line-mode t)))



;; symbolic links
(setq vc-follow-symlinks t)

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (grandshell-theme clues-theme cherry-blossom-theme distinguished-theme color-theme-sanityinc-tomorrow alect-themes cyberpunk-theme tron-legacy-theme treemacs-icons-dired treemacs-all-the-icons afternoon-theme abyss-theme treemacs-projectile projectile material-theme flycheck-pycheckers flycheck flycheck-cfn cfn-mode magit treemacs go-mode zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq user-full-name    "Chetan Yewale"
      user-mail-address "yewalechetan@gmail.com")

(add-hook 'after-init-hook 
	  (lambda ()
	    (load-theme 'distinguished t)
	    ))


;; paredit config
(autoload 'enable-paredit-mode "paredit" t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;;enable cfn lint

(flycheck-cfn-setup)
(add-hook 'cfn-mode-hook 'flycheck-mode)
(setq flycheck-highlighting-mode 'line)
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))


;; custom keys and functions
(defun openinitfile ()
  "Function to open the user init file."
   (interactive)
   (find-file user-init-file) )

(global-set-key (kbd "C-<f8>") 'treemacs) ;key to toggle treemacs
(global-set-key (kbd "C-<f6>") 'openinitfile) ;;key to open init file
(global-set-key (kbd "C-<f7>") 'ansi-term );start ansi term

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq projectile-project-search-path '("~/Monument_src/"  "~/personal_projects/"))
(treemacs) ;launch treemacs at start


(desktop-save-mode)
;; automatically load previous session on startup
;;(desktop-read)

;;if frame is closed, then automatically save the session
(add-to-list 'delete-frame-functions #'desktop-save)

