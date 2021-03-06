;;; ~/dotfiles/dots/emacs/doom/+magit.el -*- lexical-binding: t; -*-

(after! magit
	(magit-todos-mode nil)
	(magit-define-popup-option 'magit-rebase-popup
		?S "Sign using gpg" "--gpg-sign=" #'magit-read-gpg-secret-key)
	(setq magit-save-repository-buffers nil
				magit-repository-directories '(("~/org/projects" . 3)
																			 ("~/src" . 3)
																			 ("~/.emacs.d"))
				transient-values '((magit-commit "--gpg-sign=A3A9DC06A9B0856F")
													 (magit-rebase "--autosquash" "--gpg-sign=A3A9DC06A9B0856F")
													 (magit-pull   "--rebase" "--gpg-sign=A3A9DC06A9B0856F"))
				+magit-hub-features t ;; I want the PR/issue stuff too!
				+magit-hub-enable-by-default t))  ;; And I want it on by default!

(after! magithub
	(setq magithub-preferred-remote-method 'git_url
				magithub-clone-default-directory "~/src/github.com"))
