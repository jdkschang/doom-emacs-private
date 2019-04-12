;;; ~/dotfiles/dots/emacs/doom/+magit.el -*- lexical-binding: t; -*-

(after! magit
	(magit-todos-mode nil)
	(magit-define-popup-option 'magit-rebase-popup
		?S "Sign using gpg" "--gpg-sign=" #'magit-read-gpg-secret-key)
	(setq magit-save-repository-buffers nil
				magit-repository-directories '(("~/org/projects" . 3)
																			 ("~/src" . 3)
																			 ("~/.emacs.d"))
				magit-commit-arguments '("--gpg-sign=809A1C18A92416A")
				magit-rebase-arguments '("--autosquash" "--gpg-sign=809A1C18A92416A")
				magit-pull-arguments   '("--rebase" "--gpg-sign=809A1C18A92416A")
				+magit-hub-features t ;; I want the PR/issue stuff too!
				+magit-hub-enable-by-default t))  ;; And I want it on by default!

(after! magithub
	(setq magithub-preferred-remote-method 'git_url
				;; magithub-clone-default-directory "~/Dropbox/org/projects" ;; I want my stuff to clone to ~/projects
				magithub-clone-default-directory "~/src/github.com"))
