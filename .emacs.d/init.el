(unless (file-exists-p "~/.emacs.d/custom.el")
  (shell-command "touch ~/.emacs.d/custom.el"))

(org-babel-load-file "~/.emacs.d/configuration.org" nil)
