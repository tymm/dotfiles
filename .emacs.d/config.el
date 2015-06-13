(key-chord-mode 1)
(projectile-global-mode)
(global-evil-leader-mode)
(evil-mode 1)
(ac-config-default)
;; Show line numbers
(global-linum-mode t)
;; Setup python auto completion
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
