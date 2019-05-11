;;; ~/dotfiles/emacs/doom/autoload/jdkschang.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +jdkschang/find-in-dotfiles ()
	"Open a file somewhere in ~/dotfiles via a fuzzy filename search."
	(interactive)
	(doom-project-find-file (expand-file-name "~/org/projects/dotfiles")))

;;;###autoload
(defun +jdkschang/browse-dotfiles ()
	"Browse the files in ~/dotfiles."
	(interactive)
	(doom-project-browse (expand-file-name "~/org/projects/dotfiles")))

;;;###autoload
(defun +jdkschang/find-notes-for-project (&optional arg)
	"TODO"
	(interactive "P")
	(let ((project-root (doom-project-name 'nocache))
				(default-directory (expand-file-name "projects/" org-directory)))
		(if arg
				(call-interactively #'find-file)
			(find-file
			 (expand-file-name (concat project-root ".org"))))))

;;; /mnt/projects/conf/doom-emacs-private/autoload/evil.el -*- lexical-binding: t; -*-
;;;###if (featurep! :editor evil)

;;;###autoload (autoload '+jdkschang:multi-next-line "autoload/evil" nil nil)
(evil-define-motion +jdkschang:multi-next-line (count)
	"Move down 6 lines."
	:type line
	(let ((line-move-visual (or visual-line-mode (derived-mode-p 'text-mode 'magit-mode))))
		(evil-line-move (* 6 (or count 1)))))

;;;###autoload (autoload '+jdkschang:multi-previous-line "autoload/evil" nil nil)
(evil-define-motion +jdkschang:multi-previous-line (count)
	"Move up 6 lines."
	:type line
	(let ((line-move-visual (or visual-line-mode (derived-mode-p 'text-mode 'magit-mode))))
		(evil-line-move (- (* 6 (or count 1))))))
