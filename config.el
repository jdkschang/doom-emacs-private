;;; ~/dotfiles/dots/emacs/doom/config.el -*- lexical-binding: t; -*-

;; (defvar xdg-data (getenv "XDG_DATA_HOME"))
;; (defvar xdg-cache (getenv "XDG_CACHE_HOME"))
;; (defvar xdg-config (getenv "XDG_CONFIG_HOME"))

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(setq-default user-full-name    "Dmitri Chang"
							user-mail-address "jdkschang@protonmail.com"
							fill-column 100
							doom-leader-key "SPC"
							doom-localleader-key ","

							evil-shift-width 4
							tab-width 4

							+workspaces-switch-project-function #'ignore
							+pretty-code-enabled-modes '(emacs-lisp-mode org-mode)
							+format-on-save-enabled-modes '(not emacs-lisp-mode))

(add-to-list 'org-modules 'org-habit t)

;; <gs SPC> works across all visible windows
;; useful for jumping around the screen
(setq avy-all-windows t)

(add-hook 'prog-mode-hook #'goto-address-mode) ;; Linkify links!
(add-hook 'prog-mode-hook #'global-origami-mode)
;; (add-hook 'prog-mode-hook #'golden-ratio-mode)

;; emacs/term
;; set fish as my default shell
(after! multi-term
	(setq multi-term-program "/usr/local/bin/fish"))

;; lang/sh
;; setup flycheck-checkbashisms
;; flycheck checker for checking files beginning with #!/bin/sh
;; which also contain code exclusive to bash requires: checkbashism
(def-package! flycheck-checkbashisms
	:when (and (featurep! :feature syntax-checker)(featurep! :lang sh))
	:after sh-mode
	:hook (flycheck-mode . flycheck-checkbashisms-setup))

;; Load snippets
(after! yasnippet
	(push (expand-file-name "snippets/" doom-private-dir) yas-snippet-dirs))

;; ;; emacs/eshell
(after! eshell
	(set-eshell-alias!
	 "f"   "find-file $1"
	 "l"   "ls -lh"
	 "d"   "dired $1"
	 "gl"  "(call-interactively 'magit-log-current)"
	 "gs"  "magit-status"
	 "gc"  "magit-commit"
	 "rg"  "rg --color=always $*")

	;; remove modeline in eshell buffers
	(add-hook 'eshell-mode-hook #'hide-mode-line-mode))

;; (after! helm
;; 	(map! :after helm-files
;; 				:map helm-find-files-map
;; 				"C-h" #'helm-find-files-up-one-level
;; 				"C-l" #'helm-ff-RET))

;; Modules
(load! "+ui") ;; My ui mods. Also contains ligature stuff.
(load! "+magit")
(load! "+theme")
(load! "+macos")
(load! "+org") ;; Org mode stuff like todos and rebindings
(load! "+bindings")
