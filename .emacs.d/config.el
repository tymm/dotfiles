(key-chord-mode 1)
(projectile-global-mode)
(global-evil-leader-mode)
(evil-mode 1)
(ac-config-default)
;; Show relative line numbers
(global-relative-line-numbers-mode)
(setq relative-line-numbers-format #'abs-rel-numbers)

(defun abs-rel-numbers (offset)
  (if (= offset 0)
      ;; current line
      (format "%4d  " (line-number-at-pos))
    ;; not the current line
    (format "%4d  " (abs offset))
        ))

;; Set up python auto completion
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; Set up python mode
(add-to-list 'auto-mode-alist '("\.py\'" . python-mode))

;; Enable and configure the mode-line
(sml/setup)
(setq sml/theme 'dark)

(lexical-let ((default-color (cons (face-background 'mode-line) (face-foreground 'mode-line))))
(add-hook 'post-command-hook
  (lambda () (let ((color (cond ((minibufferp) default-color)
    ((evil-insert-state-p) '("#006fa0" . "#ffffff"))
    ((evil-visual-state-p)   '("#e80000" . "#ffffff"))
    (t default-color))))
    (set-face-background 'mode-line (car color))
    (set-face-foreground 'mode-line (cdr color))))))

