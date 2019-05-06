;;; ~/dotfiles/dots/emacs/doom/+macos.el -*- lexical-binding: t; -*-

;;;;
;;;; macOS specific settings
;;;;

(when IS-MAC
  (setq ns-use-thin-smoothing t) ;; thinner strokes for font-smoothing
  (setq dired-use-ls-dired nil)

  ;; macOS natural title bars
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))
;; (add-hook 'window-setup-hook #'toggle-frame-maximized))

;;; Host-specific config
;;; maybe call it system.el & include macos
(pcase (system-name)
  ("kukan"
   ;; hlissner's swapped keys
   (setq x-super-keysym 'meta
         x-meta-keysm 'super))
  ("geesee"
   (font-put doom-font size: 16)))
