;;; ~/dotfiles/dots/emacs/doom/+magit.el -*- lexical-binding: t; -*-

(after! magit
	(magit-todos-mode nil)
	(magit-define-popup-option 'magit-rebase-popup
		?S "Sign using gpg" "--gpg-sign=" #'magit-read-gpg-secret-key)
	(setq magit-save-repository-buffers nil
				magit-repository-directories '(("~/Dropbox/org/projects" . 2)
																			 ("~/src" . 3)
																			 ("~/.emacs.d"))
				magit-commit-arguments '("--gpg-sign=703A05F567070F95")
				magit-rebase-arguments '("--autostash" "--gpg-sign=703A05F567070F95")
				magit-pull-arguments   '("--rebase" "--autostash" "--gpg-sign=703A05F567070F95")
				;; magit-commit-arguments '("--gpg-sign=D1BDD1F5AA60F93E")
				;; magit-rebase-arguments '("--autostash" "--gpg-sign=D1BDD1F5AA60F93E")
				;; magit-pull-arguments   '("--rebase" "--autostash" "--gpg-sign=D1BDD1F5AA60F93E")
				+magit-hub-features t ;; I want the PR/issue stuff too!
				+magit-hub-enable-by-default t))  ;; And I want it on by default!

(after! magithub
	(setq magithub-preferred-remote-method 'git_url
				;; magithub-clone-default-directory "~/Dropbox/org/projects" ;; I want my stuff to clone to ~/projects
				magithub-clone-default-directory "~/src/github.com"))