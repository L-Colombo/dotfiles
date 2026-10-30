;;; -*- lexical-binding: t; -*-

(setq-default word-wrap t
              tab-width 4
              isearch-lazy-count t
              indent-tabs-mode nil
              set-mark-comand-repeat nil)

(setq message-log-max nil ;; prints to echo area, but not create *Messages* buffer
      make-backup-files nil
      mark-ring-max 6
      global-mark-ring-max 8
      use-short-answers t
      auto-save-default nil
      ring-bell-function 'ignore
      recentf-exclude '("~/dotfiles/.emacs.d/custom.el"
                        "~/dotfiles/.emacs.d/configuration.org"
                        "~/dotfiles/.emacs.d/init.el"
                        "~/Documents/OrgFiles/agenda/todos.org"
                        "~/Documents/OrgFiles/agenda/agenda.org"
                        "~/Dropbox/OrgFiles/agenda.org"
                        "~/Dropbox/OrgFiles/todos.org"
                        "\\.bib$"))

;; Create custom-file if does not exist
(unless (file-exists-p "~/.emacs.d/custom.el")
  (shell-command "touch ~/.emacs.d/custom.el"))
(setq custom-file "~/.emacs.d/custom.el")

;; Global key-bindings
(global-set-key (kbd "C-c <right>") #'windmove-right)
(global-set-key (kbd "C-c <left>") #'windmove-left)
(global-set-key (kbd "C-c <up>") #'windmove-up)
(global-set-key (kbd "C-c <down>") #'windmove-down)
(global-set-key (kbd "C-c DEL") #'kill-buffer-and-window)
(global-set-key (kbd "C-x C-o") #'window-swap-states)
(global-set-key (kbd "C-<up>") (lambda () (interactive) (scroll-down 1))) ;; Respect natural scrolling
(global-set-key (kbd "C-<down>") (lambda () (interactive) (scroll-up 1))) ;; Respect natural scrolling
(global-set-key (kbd "C-c j") #'join-line)
(global-set-key (kbd "C-c w w") 'whitespace-mode)
(global-set-key (kbd "C-x C-. C-f") #'find-file-at-point)
;; Disable downcase-region keybinding
(global-set-key (kbd "C-x C-l") nil)

;; MacOs SETTINGS
;; (setq mac-option-modifier nil
;;       mac-command-modifier 'meta
;;       x-select-enable-clipboard t)

;; PACKAGES

;; Add Melpa packages repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Color Themes
(use-package klere-theme
  :defer t
  :ensure t
  :config
  (custom-set-faces
   `(cursor ((t (:background "#1D8B15"))))
   `(font-latex-sedate-face ((t (:foreground "#1D8B15" :bold t))))))
(use-package kanagawa-themes
  :defer t
  :ensure t)
(use-package monokai-theme
  :defer t
  :ensure t
  :config
  (custom-set-faces
   `(italic ((t (:italic t))))))
(use-package gruber-darker-theme
  :defer t
  :ensure t
  :config
  (custom-set-faces
   `(org-level-2 ((t (:foreground "#73c936"))))
   `(org-block (( t (:background "#303540"))))
   `(font-latex-sedate-face ((t (:foreground "#73c936" :bold t))))
   `(org-quote (( t (:background "#303540"))))))

;; Whitespace
(use-package whitepace
  :ensure nil
  :defer t
  :init
  (setq-default whitespace-style '(face spaces empty tabs trailing space-mark tab-mark)
              whitespace-display-mappings '((space-mark 32 [183] [46])
                                            (tab-mark ?\t [187 ?\t] [62 ?\t])))
  (custom-set-faces
 `(whitespace-space ((t (:foreground "#555555"))))
 `(whitespace-tab   ((t (:foreground "#555555" :bold t))))
 `(line-number-current-line ((t (:foreground "#000000" :background "#fc0fc0")))))
  (add-hook 'before-save-hook 'whitespace-cleanup))

;; Dired
(use-package dired
  :ensure nil
  :defer t
  :init (put 'dired-find-alternate-file 'disabled nil)
  :bind (:map dired-mode-map ("RET" . #'dired-find-alternate-file))
  :config
  (setq dired-listing-switches "--group-directories-first -alhF")
  (global-set-key (kbd "C-x C-j") #'dired-jump-other-window)
  :hook ((dired-mode . dired-hide-details-mode)))

;; Magit
(use-package magit
  :defer t
  :ensure t
  :bind (("M-g M-i M-t" . #'magit)))

;; Rainbow-Delimiters
(use-package rainbow-delimiters
  :ensure t
  :defer t
  :hook ((lisp-mode . rainbow-delimiters-mode)
         (emacs-lisp-mode . rainbow-delimiters-mode)))

;; Helpful
(use-package helpful
  :ensure t
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)
         ("C-h x" . helpful-command)
         ("C-h ." . helpful-at-point)))

;; Marginalia
(use-package marginalia
  :defer t
  :ensure t
  :init
  (marginalia-mode))

;; Git
(use-package git-gutter
  :ensure t
  :bind (("C-c p" . 'git-gutter:previous-hunk)
         ("C-c n" . 'git-gutter:next-hunk)
         ("C-c g s" . 'git-gutter:stage-hunk)
         ("C-c g r" . 'git-gutter:revert-hunk))
  :config (global-git-gutter-mode 1))

;; Markdown
(use-package markdown-mode
  :defer t
  :ensure t)

;; LaTeX
(use-package auctex
  :defer t
  :ensure t
  :init
  (require 'latex)
  (setq TeX-parse-self t
        TeX-view-program-selection '((output-pdf "Zathura"))
        TeX-source-correlate-start-server t
        Tex-source-correlate-method '((pdf . synctex)))
  (setq-default TeX-master "main")
  (TeX-source-correlate-mode)
  (define-key TeX-source-correlate-map [C-down-mouse-1] #'TeX-view-mouse))

(defun latex-smart-quotes (&optional double)
  "A smarter way to inser quotes in LaTeX and/or wrap a region with quotes"
  (interactive)
  (let* ((left-quote (if double "``" "`"))
         (right-quote (if double "''" "'"))
         (offset (if double 2 1)))

    (if (region-active-p)
        (progn
          (let ((region-left-buondary (region-beginning))
                (region-right-boundary (region-end)))
            (goto-char region-left-buondary)
            (insert left-quote)
            (goto-char (+ region-right-boundary offset))
            (insert right-quote)))

      (progn
        (insert left-quote)
        (insert right-quote)
        (backward-char offset)))))

(use-package latex
  :defer t
  ;; builtin, no need to :ensure
  :hook ((LaTeX-mode . turn-on-reftex)
         (LaTeX-mode . visual-line-mode))
  :bind (:map LaTeX-mode-map
              (("`" . #'latex-smart-quotes)
               ("\"" . (lambda () (interactive) (latex-smart-quotes t))))))

(use-package reftex
  :defer t
  :ensure t
  :init
  (setq reftex-plug-into-AUCTeX t
        reftex-cite-prompt-optional-args t))

;; Ido & Vertico
(use-package ido-vertical-mode
  :ensure t
  :init (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  :config
  (ido-mode 1)
  (ido-vertical-mode 1))

(use-package vertico
  :ensure t
  :config
  (vertico-mode 1)
  :bind (:map minibuffer-local-map (("C-n" . #'vertico-next)
                                    ("C-p" . #'vertico-previous))))

;; Org & Related
(use-package org
  :defer t
  :ensure t
  :init (setq org-hide-emphasis-markers t
              org-startup-folded 'content
              org-startup-truncated nil
              org-directory "~/Dropbox/OrgFiles"
              org-edit-src-content-indentation 0
              org-src-tab-acts-natively t
              org-ellipsis " "
              org-src-preserve-indentation t
              org-tags-column 0
              org-capture-bookmark nil
              org-agenda-skip-deadline-if-done t
              org-agenda-skip-scheduled-if-done t
              org-fontify-quote-and-verse-blocks t)
  :hook ((org-mode . org-indent-mode)
         (org-mode . visual-line-mode)))
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(use-package org-bullets
  :defer 3
  :ensure t
  :custom (org-bullets-bullet-list '(""))
  :hook (org-mode . org-bullets-mode))

(setq org-capture-templates
      '(("a" "Agenda" entry (file+headline "~/Dropbox/OrgFiles/agenda.org" "Agenda")
         "* %?\n %T %i\n")
        ("t" "Todo" entry (file+headline "~/Dropbox/OrgFiles/todos.org" "Tasks")
         "* TODO %?\n SCHEDULED: %T\n %iDEADLINE:  %T\n ENTERED: %U %i")))
(setq org-agenda-span 'year
      org-agenda-files '("~/Dropbox/OrgFiles/agenda.org" "~/Dropbox/OrgFiles/todos.org"))

(use-package org-roam
  :defer t
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Documents/OrgFiles/org-roam/"))
  (find-file-visit-truename t)
  (org-roam-capture-templates '(("c" "Concept Notes" plain "#+STARTUP: content\n\n* Description\n%?\n\n* Bibliography\n\n* Primary sources"
                                 :if-new (file+head "1_${slug}.org" "#+title: con_${concept}"))
                                ("l" "Literature notes" plain
                                 "#+STARTUP: show2levels\n\n*  %^{FullTitle}\nAuthor: %^{Author}\nYear: %^{Year}\nType: %^{Type}\nFull reference: %^{FullReference}\n* Notes\n%?"
                                 :if-new (file+head "${slug}.org" "#+title: ${title}\n#+filetags: ${title}"))
                                ("p" "Project Notes" plain "#+STARTUP: content\n\n* ${title}\nType: %^{Type}\n\n* Description\n%?\n\n* Structure\n \n\n* Concepts\n"
                                 :if-new (file+head "2_${slug}.org" "#+title: pj_${title}"))
                                ("s" "Source Notes" plain
                                 "#+STARTUP: show2levels\n\n*  %^{FullTitle}\nAuthor?: %^{Author}\nPeriod: %^{Period}\nType: %^{Type}\nEdited?: %^{Edited}\n* Notes\n%?"
                                 :if-new (file+head "3_${slug}.org" "#+title: s_${title}\n#+filetags: ${title}"))))
  :bind (("C-c r d" . org-roam-buffer-display-dedicated)
         ("C-c r f" . org-roam-node-find)
         ("C-c r g" . org-roam-graph)
         ("C-c r i" . org-roam-node-insert)
         ("C-c r c" . org-roam-capture))
  :config
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  (require 'org-roam-protocol))

;; Completions
(use-package corfu
  :defer 3
  :ensure t
  :custom
  (corfu-cycle t)
  (corfu-quit-at-boundary t)
  (corfu-preselect 'first)
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 1)
  :bind (:map corfu-map
              ("C-n" . corfu-next)
              ("C-p" . corfu-previous)
              ("C-q" . corfu-quick-insert)
              ("M-q" . corfu-quick-complete))
  :init (global-corfu-mode))

(use-package cape
  :defer 3
  :ensure t
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

(use-package orderless
  :ensure t
  :config (setq completion-styles '(orderless partial-completion basic)
                completion-category-defaults nil
                completion-category-overrides nil))

;; Consult
(use-package consult
  :defer
  :ensure t
  :bind
  (("C-c f f" . consult-find)
   ("C-c f s" . consult-ripgrep)
   ("C-c f m" . consult-mark)
   ("C-c f b" . consult-buffer)
   ("C-c f t" . consult-theme)))

(use-package dashboard
  :ensure t
  :init (setq dashboard-startup-banner 'logo
              dashboard-set-heading-icons nil
              dashboard-set-file-icons nil
              dashboard-center-content t
              dashboard-vertically-center-content t
              ;; dashboard-icon-type 'all-the-icons
              dashboard-agenda-sort-strategy '(time-up)
              dashboard-footer-messages '("")
              dashboard-items '((bookmarks . 5)
                                (agenda . 10)
                                (recents . 10)
                                (projects . 10)))
  :config (dashboard-setup-startup-hook)
  :bind ("C-c d o" . #'dashboard-open))

;; Move-Text
(use-package move-text
  :defer t
  :ensure t
  :init (move-text-default-bindings))
(defun indent-region-advice (&rest ignored)
  (let ((deactivate deactivate-mark))
    (if (region-active-p)
      (indent-region (region-beginning) (region-end))
      (indent-region (line-beginning-position) (line-end-position)))
    (setq deactivate-mark deactivate)))
(advice-add 'move-text-up :after 'indent-region-advice)
(advice-add 'move-text-down :after 'indent-region-advice)

;; Wrap-Region
(use-package wrap-region
  :defer t
  :ensure t
  :init (setq wrap-region-except-modes 'dired-mode)
  :config (wrap-region-mode t))

;; Spell-Check
(unless (eq system-type 'darwin)
  (setq ispell-program-name "hunspell"))
;; fixes error popping up during autocompletion
(setq text-mode-ispell-word-completion nil)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'nroff-mode-hook 'flyspell-mode)

;; Tgr
(use-package tgr
  :load-path "~/Programming/0_projects/tgr-emacs-wrapper"
  :bind (("C-c 1" . #'tgr/search)
         ("C-c 2" . #'tgr/tags-all)
         ("C-c 3" . #'tgr/tags-file)
         ("C-c 4" . #'tgr/refile)
         ("C-c 5" . #'tgr/locate))
  :init (setq tgr/tgr-directory
              "~/Documents/OrgFiles/org-roam"))

;; Eglot
(use-package eglot
  :config
  (add-hook 'eglot-managed-mode-hook
            (lambda ()
              (eglot-inlay-hints-mode -1)))
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(latex-mode . ("texlab")))))

(load "~/.emacs.d/custom-functions.el")

;; Create custom-file if does not exist
(unless (file-exists-p "~/.emacs.d/custom.el")
  (shell-command "touch ~/.emacs.d/custom.el"))
(setq custom-file "~/.emacs.d/custom.el")

(set-frame-font "Terminess Nerd Font Propo 20" nil t)
