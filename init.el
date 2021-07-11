;;; package --- Summary
;;; Commentary:
;; Chetan's Emacs config
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))
(package-initialize)
;;(package-refresh-contents) ;;this contacts all repos and slows down.. enable only if you want to refresh packages


(global-linum-mode t)

;;so that you can see matching params
(show-paren-mode 1)
;;;;;;;;;;;;;;;;;;;;; Emacs appearance
;; Disable start splash screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

(set-face-attribute 'default nil :height 160)

;; set cursor type
(setq-default cursor-type 'bar)

;;hide toolbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(save-place-mode 1)

;;word wrap settings
(setq word-wrap t)
(setq visual-line-mode t)

;;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)
;; symbolic links
(setq vc-follow-symlinks t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (origami treemacs-magit ivy-rich counsel swiper ivy json-mode grandshell-theme cherry-blossom-theme distinguished-theme cyberpunk-theme tron-legacy-theme treemacs-icons-dired treemacs-all-the-icons afternoon-theme treemacs-projectile projectile project material-theme flycheck-pycheckers flycheck flycheck-cfn cfn-mode magit treemacs go-mode))))
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
            (treemacs)
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

(global-set-key (kbd "C-<f6>") 'openinitfile) ;;key to open init file
(global-set-key (kbd "C-<f7>") 'ansi-term );start ansi term

(use-package projectile
  :config (projectile-mode)
  :custom (
           (setq projectile-project-search-path '("~/Monument_src/"  "~/personal_projects/")))
  :bind (
         ("C-c p" . projectile-command-map )

         ) )


(use-package treemacs
  :after projectile
  :custom (setq treemacs-recenter-after-file-follow always)
  :bind ( ("C-<f8>" . treemacs) )
  )

(setq keyboard-type "standard")

;; for code folding
(use-package origami
  :config (origami-mode)
  :bind ( ("M-[" . origami-close-node)
          ("M-s-[" . origami-close-all-nodes)  ;; s is for the windows key
          ("M-]" . origami-open-node )
          ("M-s-]" . origami-open-all-nodes )
           )
  )

;; enable origami mode globally to enable code folding
(global-origami-mode)

(desktop-save-mode)
;; automatically load previous session on startup
;;(desktop-read)

;;if frame is closed, then automatically save the session
(add-to-list 'delete-frame-functions #'desktop-save)

;; keys for indenting and unindenting
(defun my-indent-region (N)
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N 1))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(defun my-unindent-region (N)
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N -1))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(global-set-key ">" 'my-indent-region)
(global-set-key "<" 'my-unindent-region)


;; keys for json prettifying currently selected region
(defun my-json-prettify(N)
  (interactive "p")
  (if (use-region-p)
      (json-pretty-print (region-beginning) (region-end) )

   ))

(global-set-key (kbd "C-S-i") 'my-json-prettify)  ;;Ctrl+Shift+i for json prettify


;;; ivy config
(use-package counsel
  :after ivy
  :config (counsel-mode)
  :bind ( ("M-x" . counsel-M-x)
          ("C-x C-f" . counsel-find-file )
          ("<f1> f" . counsel-describe-function )
          ("<f1> v" . counsel-describe-variable)
          ("<f1> o" . counsel-describe-symbol )
          ("<f1> l" . counsel-find-library)
          ("C-y" . counsel-yank-pop)
          ("C-x b" . counsel-switch-buffer)) 
  )
  
(use-package ivy
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))


(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(provide 'init)
;;; init.el ends here
