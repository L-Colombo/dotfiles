;;  _     ____           _____
;; | |   / ___|         | ____|_ __ ___   __ _  ___ ___
;; | |  | |      _____  |  _| | '_ ` _ \ / _` |/ __/ __|
;; | |__| |___  |_____| | |___| | | | | | (_| | (__\__ \
;; |_____\____|         |_____|_| |_| |_|\__,_|\___|___/
;;   ____             __ _
;;  / ___|___  _ __  / _(_) __ _
;; | |   / _ \| '_ \| |_| |/ _` |
;; | |__| (_) | | | |  _| | (_| |
;;  \____\___/|_| |_|_| |_|\__, |
;;                         |___/


;; Create custom-file if does not exist
(unless (file-exists-p "~/.emacs.d/custom.el")
  (shell-command "touch ~/.emacs.d/custom.el"))
(setq custom-file "~/.emacs.d/custom.el")

;; SETUP PACKAGE REPOSITORIES
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; DEFAULT SETTINGS
(auto-save-mode -1)
(tool-bar-mode -1)
(menu-bar-mode 1)
(electric-pair-mode 1)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(repeat-mode 1)

(setq-default word-wrap t
              tab-width 4
              isearch-lazy-count t
              indent-tabs-mode nil)

(setq display-line-numbers-type 'relative
      inhibit-startup-screen 't
      make-backup-files nil
      auto-save-default nil
      ring-bell-function 'ignore
      recentf-exclude '("~/dotfiles/.emacs.d/custom.el"
                        "~/dotfiles/.emacs.d/configuration.org"
                        "~/dotfiles/.emacs.d/init.el"
                        "~/Documents/OrgFiles/capture/todos.org"
                        "~/Documents/OrgFiles/capture/agenda.org"))

(put 'donwcase-region 'disabled nil)

;; (add-to-list 'default-frame-alist '(height . 34))
;; (add-to-list 'default-frame-alist '(width . 102))

(set-frame-font "Pragmasevka Nerd Font 18" nil t)

;; MARK SETTINGS
(setq mark-ring-max 6
      global-mark-ring-max 8)
(setq-default set-mark-comand-repeat nil)

;; WHITESPACE SETTINGS
(setq-default whitespace-style '(face spaces empty tabs trailing space-mark tab-mark)
              whitespace-display-mappings '((space-mark 32 [183] [46])
                                            (tab-mark ?\t [187 ?\t] [62 ?\t])))
(custom-set-faces
 `(whitespace-space ((t (:foreground "#555555"))))
 `(whitespace-tab   ((t (:foreground "#555555" :bold t)))))
(global-set-key (kbd "C-c w w") 'whitespace-mode)
(add-hook 'before-save-hook 'whitespace-cleanup)

;; DIRED SETTINGS
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'dired-mode-hook
		  (lambda () (local-set-key (kbd "RET") #'dired-find-alternate-file)))
(unless (eq system-type 'darwin)
  (setq dired-listing-switches "--group-directories-first -alhF"))

;; WINDOW
(global-set-key (kbd "C-c <right>") #'windmove-right)
(global-set-key (kbd "C-c <left>") #'windmove-left)
(global-set-key (kbd "C-c <up>") #'windmove-up)
(global-set-key (kbd "C-c <down>") #'windmove-down)
(global-set-key (kbd "C-c DEL") #'kill-buffer-and-window)
(global-set-key (kbd "C-x C-o") #'window-swap-states)

;; MacOs SETTINGS
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

;; COLOR THEMES
(use-package klere-theme
  :defer t
  :ensure t)
(use-package gruber-darker-theme
  :defer t
  :ensure t)
(use-package color-theme-modern
  :defer t
  :ensure t)

(load-theme 'klere t)
(set-cursor-color "#ff5500")

;; CUSTOM FUNCTIONS
(defun open-shell-in-split-window ()
  "Open a terminal in a split window"
  (interactive)
  (let ((buf (term "/usr/bin/zsh")))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))
(global-set-key (kbd "C-M-<return>") #'open-shell-in-split-window)

(defun copy-current-line ()
  "Copy the current line from begin to end"
  (interactive)
  (save-excursion
    (kill-ring-save
     (progn (beginning-of-line) (point))
     (progn (end-of-line) (point)))))
(global-set-key (kbd "C-S-c") #'copy-current-line)

(defun goto-matching-par (&optional arg)
  "Go to the matching parenthesis character if one is adjacent to point."
  (interactive "^p")
  (cond ((looking-at "\\s(") (forward-sexp arg))
        ((looking-back "\\s)" 1) (backward-sexp arg))
        ;; Now, try to succeed from inside of a bracket
        ((looking-at "\\s)") (forward-char) (backward-sexp arg))
        ((looking-back "\\s(" 1) (backward-char) (forward-sexp arg))))
(global-set-key (kbd "C-%") #'goto-matching-par)

(defun kill-all-other-buffers ()
  "Kill all the open buffers except the one displayed in the current window"
  (interactive)
  (let ((current-buf (window-buffer)))
    (dolist (buf (buffer-list))
      (unless (eq current-buf buf)
        (kill-buffer buf))))
  (delete-other-windows)
  (message "All buffers have been killed"))
(global-set-key (kbd "C-x C-k") #'kill-all-other-buffers)

(defun break-at-period ()
  "Break line after every period not at EOL"
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (while (search-forward "." nil t)
      (when (eq (char-after) 32) ;; "32" is the whitespace char
        (delete-char 1)
        (insert ?\n)))))

(defun deundescore ()
  "Substitutes all undescore in the current line with whitespace"
  (interactive)
  (save-excursion
    (let ((beg (point)))
      (replace-region-contents beg (beginning-of-line)
                               (query-replace "_" " ")))))
(global-set-key (kbd "C-c C-x SPC") #'deundescore)

(defun accented ()
  "Easily inser an accented character"
 (interactive)
  (let* ((char-alist '((?a "á" "Á" "à" "À" "â" "Â" "ä" "Ä" "ã" "Ã" "å" "Å" "æ" "Æ")
                       (?e "é" "É" "è" "È" "ê" "Ê" "ë" "Ë")
                       (?i "í" "Í" "ì" "Ì" "î" "Î" "ï" "Ï")
                       (?o "ó" "Ó" "ò" "Ò" "ô" "Ô" "ö" "Ö" "õ" "Õ" "ø" "Ø" "œ" "Œ")
                       (?u "ü" "Ü" "ù" "Ù" "ú" "Ú" "û" "Û")
                       (?c "ç" "Ç")
                       (?h "Ḥ" "ḥ")
                       (?n "ñ" "Ñ")
                       (?s "ß")))
         (char-keys (mapcar #'car char-alist))
         (chosen-key (read-char-choice
                      ;; Generate prompt using list of keys from `char-alist'
                      (concat "Accent a character: "
                              (mapconcat (lambda (k) (make-string 1 k)) char-keys " ")
                              " ")
                      char-keys))
         (chosen-char-list (alist-get chosen-key char-alist))
         (chosen-char (if (= (length chosen-char-list) 1)
                          (car chosen-char-list)
                        (completing-read "-> " chosen-char-list))))
    (insert chosen-char)))
(global-set-key (kbd "C-c C-x `") #'accented)

(defadvice kill-region (before unix-werase activate compile)
  "When called interactively with no active region, delete a single word
    backwards instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (save-excursion (backward-word 1) (point)) (point)))))

(defun spell-it ()
  "Change spelling dictionary to Italian and check buffer"
  (interactive)
  (ispell-change-dictionary "italiano")
  (flyspell-buffer))

;; PACKAGES AND MODES
;; ESHELL
(defun lc/configure-eshell ()
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)
  (setq eshell-history-size         10000
        eshell-buffer-maximum-lines 10000
        eshell-hist-ignoredups t
        eshell-scroll-to-bottom-on-input t))
(use-package eshell
  :ensure t
  :hook (eshell-first-time-mode . lc/configure-eshell))

;; RAINBOW-DELIMITERS
(use-package rainbow-delimiters
  :ensure t
  :defer t
  :hook ((lisp-mode . rainbow-delimiters-mode)
         (emacs-lisp-mode . rainbow-delimiters-mode)))

;; HELPFUL
(use-package helpful
  :ensure t
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)
         ("C-h x" . helpful-command)
         ("C-h ." . helpful-at-point)))

;; MARGINALIA
(use-package marginalia
  :defer t
  :ensure t
  :init
  (marginalia-mode))

;; GIT
(use-package git-gutter
  :ensure t
  :bind (("C-c p" . 'git-gutter:previous-hunk)
         ("C-c n" . 'git-gutter:next-hunk)
         ("C-c g s" . 'git-gutter:stage-hunk)
         ("C-c g r" . 'git-gutter:revert-hunk))
  :config (global-git-gutter-mode 1))

;; EXPAND-REGION
(use-package expand-region
  :defer 2
  :ensure t
  :init (pending-delete-mode t)
  :bind ("C-." . er/expand-region))

;; AVY
(use-package avy
  :defer 3
  :ensure t
  :bind ("C-c SPC" . 'avy-goto-char))

;; MARKDOWN
(use-package markdown-mode
  :defer t
  :ensure t)

;; LaTeX
(use-package auctex
  :defer t
  :ensure t
  :init (require 'latex)
  (setq TeX-parse-self t
        TeX-view-program-selection '((output-pdf "Zathura"))
;;        TeX-view-program-list '(("Zathura" TeX-pdf-tools-sync-view))
        TeX-source-correlate-start-server t
        Tex-source-correlate-method '((pdf . synctex)))
;;  (setq-default TeX-master "main")
  (TeX-source-correlate-mode)
  (define-key TeX-source-correlate-map [C-down-mouse-1] #'TeX-view-mouse)
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer))

(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; IDO & VERTICO
(use-package ido-vertical-mode
  :ensure t
  :init (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  :config
  (ido-mode 1)
  (ido-vertical-mode 1))

(use-package vertico
  :ensure t
  :config (vertico-mode 1))

(keymap-set minibuffer-local-map "C-n" #'vertico-next)
(keymap-set minibuffer-local-map "C-p" #'vertico-previous)

;; ORG & RELATED
(unless (file-exists-p "~/Documents/OrgFiles")
  (make-directory "~/Documents/OrgFiles"))

(use-package org
  :defer t
  :ensure t
  :init (setq org-hide-emphasis-markers t
              org-startup-folded 'content
              org-startup-truncated nil
              org-directory "~/Documents/OrgFiles"
              org-edit-src-content-indentation 0
              org-src-tab-acts-natively t
              org-ellipsis " "
              org-src-preserve-indentation t
              org-tags-column 0
              org-capture-bookmark nil)
  :hook (org-mode . org-indent-mode))
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(use-package citeproc
  :defer t
  :ensure t)

(use-package org-bullets
  :defer 3
  :ensure t
  :custom (org-bullets-bullet-list '(""))
  :hook (org-mode . org-bullets-mode))

(unless (file-exists-p "~/Documents/OrgFiles/capture")
  (make-directory "~/Documents/OrgFiles/capture"))

(setq org-default-notes-file (concat org-directory "capture/notes.org"))
(setq org-capture-templates
      '(("a" "Agenda" entry (file+headline "~/Documents/OrgFiles/capture/agenda.org" "Agenda")
         "* %?\n %T %i\n")
        ("n" "Notes" entry (file+headline  "~/Documents/OrgFiles/capture/notes.org" "Notes")
         "* %?\nEntered on %U\n %i\n")
        ("t" "Todo" entry (file+headline "~/Documents/OrgFiles/capture/todos.org" "Tasks")
         "* TODO %?\n SCHEDULED: %T\n %iDEADLINE:  %T\n %i")))
(setq org-agenda-span 'year
      org-agenda-files '("~/Documents/OrgFiles/capture"))

(unless (file-exists-p "~/Documents/OrgFiles/org-roam")
  (make-directory "~/Documents/OrgFiles/org-roam"))
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
                                 :if-new (file+head "2_${slug}.org" "#+title: pj_${title}"))))
  :bind (("C-c r d" . org-roam-buffer-display-dedicated)
         ("C-c r f" . org-roam-node-find)
         ("C-c r g" . org-roam-graph)
         ("C-c r i" . org-roam-node-insert)
         ("C-c r c" . org-roam-capture))
  :config
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  (require 'org-roam-protocol))

(use-package org-roam-ui
  :ensure t
  :after org-mode)

;; COMPLETIONS
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

;; CONSULT
(use-package consult
  :defer
  :ensure t
  :bind
  (("C-c f f" . consult-find)
   ("C-c f s" . consult-ripgrep)
   ("C-c f m" . consult-mark)
   ("C-c f b" . consult-buffer)
   ("C-c f t" . consult-theme)))

;; DASHBOARD
(use-package all-the-icons
  :defer 10
  :ensure t)

(use-package dashboard
  :ensure t
  :init (setq dashboard-icon-type 'all-the-icons
              dashboard-set-heading-icons nil
              dashboard-set-file-icons t
              dashboard-agenda-sort-strategy '(time-up)
              dashboard-items '((bookmarks . 5)
                                (agenda . 5)
                                (projects . 5)
                                (recents . 10)))
  :config (dashboard-setup-startup-hook))
(global-set-key (kbd "C-c d o") 'dashboard-open)

;; MAGIT
(use-package magit
  :defer t
  :ensure t)

;; MOVE-TEXT
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
;; DOOM-MODELINE
(use-package nerd-icons
  :defer 10
  :ensure t)
(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode 1)
  (setq doom-modeline-enable-word-count t))

;; WRAP-REGION
(use-package wrap-region
  :defer t
  :ensure t
  :init (setq wrap-region-except-modes 'dired-mode)
  :config (wrap-region-mode t))

;; SPELL-CHECK
(unless (eq system-type 'darwin)
  (setq ispell-program-name "hunspell"))
;; fixes error popping up during autocompletion
(setq text-mode-ispell-word-completion nil)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'nroff-mode-hook 'flyspell-mode)
(add-hook 'flyspell-mode-hook (lambda () (unbind-key "C-." 'flyspell-mode-map)))

;; LANGUAGETOOL
(use-package languagetool
  :ensure t
  :defer t
  :commands (languagetool-check
             languagetool-clear-suggestions
             languagetool-correct-at-point
             languagetool-correct-buffer
             languagetool-set-language
             languagetool-server-mode
             languagetool-server-start
             languagetool-server-stop)
  :config
  (setq languagetool-java-arguments '("-Dfile.encoding=UTF-8"
                                    "-cp" "/usr/share/languagetool:/usr/share/java/languagetool/*")
      languagetool-console-command "org.languagetool.commandline.Main"
      languagetool-server-command "org.languagetool.server.HTTPServer"))

(use-package tagger
  :load-path "~/Programming/emacs-hacking/tagger-emacs-wrapper"
  :bind (("C-c 1" . #'tagger/search)
         ("C-c 2" . #'tagger/tags-all)
         ("C-c 3" . #'tagger/tags-file)
         ("C-c 4" . #'tagger/refile)
         ("C-c 5" . #'tagger/locate))
  :init (setq tagger/tagger-directory
              "~/Documents/OrgFiles/org-roam"))

;; Load the custom-file; we're ready to roll
(load "~/.emacs.d/custom.el")
