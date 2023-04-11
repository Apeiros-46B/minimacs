; for g; and g, motions and the . register
(use-package goto-chg)

; main package
(use-package evil
  :config
    ; undo system
    (evil-set-undo-system 'undo-redo)

    ; fix keybinds in agenda
    (evil-set-initial-state 'org-agenda-mode 'normal)

    ; {{{ state indicator via cursor shape & color
    (setq
      evil-emacs-state-cursor    `(box        ,(getcol 'red   ))
      evil-normal-state-cursor   `( box       ,(getcol 'fg1   ))
      evil-insert-state-cursor   `((bar . 2)  ,(getcol 'blue  ))
      evil-visual-state-cursor   `( box       ,(getcol 'purple))
      evil-motion-state-cursor   `( box       ,(getcol 'aqua  ))
      evil-replace-state-cursor  `((hbar . 2) ,(getcol 'red   ))
      evil-operator-state-cursor `((hbar . 2) ,(getcol 'green )))
    ; }}}

    ; activate
    (require 'evil)
    (evil-mode 1))

; {{{ vim's C-a and C-x
(use-package evil-numbers
  :commands evil-numbers/inc-at-pt evil-numbers/dec-at-pt
  :init
    (defkm '(normal visual) "C-a"   'evil-numbers/inc-at-pt)
    (defkm '(normal visual) "C-S-a" 'evil-numbers/dec-at-pt))
; }}}

; surround
(use-package evil-surround
  :config (global-evil-surround-mode 1))

; evil bindings for org-mode
(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
    (require 'evil-org-agenda)
    (evil-org-agenda-set-keys))
