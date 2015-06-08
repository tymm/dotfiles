(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
	 user-emacs-directory)
	((boundp 'user-init-directory)
	 user-init-directory)
	(t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
						 ("org" . "http://orgmode.org/elpa/")
						 ("gnu" . "http://elpa.gnu.org/packages/")))
(require 'package)
(package-initialize)
(require 'cl)

(load-user-file "prelude-packages.el")
(load-user-file "packages.el")
(load-user-file "keys.el")
