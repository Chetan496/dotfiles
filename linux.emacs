;; to make changes in .emacs come to effect, you need to byte-compile this file everytime you make a change
;; do it from the "Emacs-Lisp" menu

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
)

(load-theme 'grandshell t)

(set-face-attribute 'default nil :font "Monaco-10")
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)


(load "~/.emacs.d/nasm-mode.el")
(require 'nasm-mode)
(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0c387e27a3dd040b33c6711ff92e13bd952369a788eee97e4e4ea2335ac5528f" "f0d8af755039aa25cd0792ace9002ba885fd14ac8e8807388ab00ec84c9497d7" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "b7d8113de2f7d9a3cf42335d8eed8415b5a417e7f6382e59076f9f4ae4fa4cee" default)))
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; enable line numbers for all modes
(global-linum-mode t)
;;display time in status
(display-time-mode t)
;;also display column numbers
(column-number-mode t)
;; let us hide the tool bar
(tool-bar-mode -1)

;; set frame size
(when window-system (set-frame-size (selected-frame) 100 50))
;; no blinking cursor
(blink-cursor-mode 0)
;; vertical bar cursor
(setq cursor-type '(bar . 2))

;; for JavaScript development

;; simple js mode for json files with js2-minor-mode
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode) )
(add-hook 'js-mode-hook 'js2-minor-mode)

;; js2-mode for js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq js2-highlight-level 3)

;;enable tern and company-mode with company-tern as backend for auto-completion
;; tern requires the npm package "tern" to be installed globally on the system. use npm install -g tern for installing
(add-hook 'js2-mode-hook 'tern-mode )
(add-hook 'js2-mode-hook 'company-mode )
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-tern))


;; open recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; for switching between windows
(windmove-default-keybindings)


;; Erlang major mode
(require 'erlang-start)
(setq erlang-root-dir "/home/MAC/Study/erlang/18.1/lib/erlang")

;;Elm mode autocompletion setup
;;This uses the NPM package elm-oracle
(add-hook 'elm-mode-hook #'elm-oracle-setup-completion)

