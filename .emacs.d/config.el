(key-chord-mode 1)
(projectile-global-mode)
(global-evil-leader-mode)
(evil-mode 1)
(ac-config-default)
;; Show line numbers
(global-linum-mode t)
(setq linum-format "%4d  ")
;; Set up python auto completion
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; Set up python mode
(add-to-list 'auto-mode-alist '("\.py\'" . python-mode))
