(defvar prelude-packages
  '(evil solarized-theme key-chord projectile evil-leader flx-ido auto-complete auto-complete-nxml jedi python-mode scala-mode2 relative-line-numbers)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (cl-loop for p in prelude-packages
	when (not (package-installed-p p)) do (cl-return nil)
	finally (cl-return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package verisons)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'prelude-packages)
