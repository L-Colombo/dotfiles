;; CUSTOM FUNCTIONS
;; (defun rgrep (regexp &optional files dir confirm)
;;   "Recursively grep for REGEXP in FILES in directory tree rooted at DIR.
;; The search is limited to file names matching shell pattern FILES.
;; FILES may use abbreviations defined in `grep-files-aliases', e.g.
;; entering `ch' is equivalent to `*.[ch]'.  As whitespace triggers
;; completion when entering a pattern, including it requires
;; quoting, e.g. `\\[quoted-insert]<space>'.

;; With \\[universal-argument] prefix, you can edit the constructed shell command line
;; before it is executed.
;; With two \\[universal-argument] prefixes, directly edit and run `grep-find-command'.

;; Collect output in the \"*grep*\" buffer.  While the recursive grep is running,
;; you can use \\[next-error] (M-x next-error), or \\<grep-mode-map>\\[compile-goto-error] \
;; in the grep output buffer,
;; to visit the lines where matches were found.  To kill the job
;; before it finishes, type \\[kill-compilation].

;; This command shares argument histories with \\[lgrep] and \\[grep-find].

;; When called programmatically and FILES is nil, REGEXP is expected
;; to specify a command to run.

;; If CONFIRM is non-nil, the user will be given an opportunity to edit the
;; command before it's run.

;; Interactively, the user can use \
;; \\<read-regexp-map>\\[read-regexp-toggle-case-fold] \
;; while entering the regexp
;; to indicate whether the grep should be case sensitive or not."
;;   (interactive
;;    (progn
;;      (grep-compute-defaults)
;;      (cond
;;       ((and grep-find-command (equal current-prefix-arg '(16)))
;;        (list (read-from-minibuffer "Run: " grep-find-command
;; 				   nil nil 'grep-find-history)))
;;       ((not grep-find-template)
;;        (error "grep.el: No `grep-find-template' available"))
;;       (t (let* ((regexp (grep-read-regexp))
;; 		(files (grep-read-files regexp))
;; 		(dir (read-directory-name "Base directory: "
;; 					  nil default-directory t))
;; 		(confirm (equal current-prefix-arg '(4))))
;; 	   (list regexp files dir confirm))))))
;;   ;; If called non-interactively, also compute the defaults if we
;;   ;; haven't already.
;;   (unless grep-find-template
;;     (grep-compute-defaults))
;;   (when (and (stringp regexp) (> (length regexp) 0))
;;     (unless (and dir (file-accessible-directory-p dir))
;;       (setq dir default-directory))
;;     (unless (string-equal (file-remote-p dir) (file-remote-p default-directory))
;;       (let ((default-directory dir))
;;         (grep-compute-defaults)))
;;     (if (null files)
;; 	(if (not (string= regexp (if (consp grep-find-command)
;; 				     (car grep-find-command)
;; 				   grep-find-command)))
;; 	    (compilation-start regexp #'grep-mode))
;;       (setq dir (file-name-as-directory (expand-file-name dir)))
;;       (let* ((case-fold-search (read-regexp-case-fold-search regexp))
;;              (command (rgrep-default-command regexp files nil)))
;; 	(when command
;; 	  (if confirm
;; 	      (setq command
;; 		    (read-from-minibuffer "Confirm: "
;; 					  command nil nil 'grep-find-history))
;; 	    (add-to-history 'grep-find-history command))
;;           (grep--save-buffers)
;; 	  (let ((default-directory dir))
;; 	    (compilation-start command #'grep-mode))
;; 	  ;; Set default-directory if we started rgrep in the *grep* buffer.
;; 	  (if (eq next-error-last-buffer (current-buffer))
;; 	      (setq default-directory dir)))))))

(defun nix-upgrade ()
  "Upgrade NixOS system"
  (interactive)
  (async-shell-command "sudo nixos-rebuild switch --upgrade"))
(global-set-key (kbd "C-S-u") #'nix-upgrade)

(defun my-ping ()
  "Ping 8.8.8.8 ten times"
  (interactive)
  (if (eq nil (member "*Ping 8.8.8.8*" (mapcar #'buffer-name (buffer-list))))
      (ping "8.8.8.8" '("-c 10"))
    (progn
      ;; all this just to kill the buffer w/out confitmation
      (setq kill-buffer-query-functions
            (delq 'process-kill-buffer-query-function
                  kill-buffer-query-functions))
      (kill-buffer "*Ping 8.8.8.8*")
      (delete-other-windows))))
(global-set-key (kbd "M-_") #'my-ping)

(defun quit-magit ()
  "Kill all buffer created by magit"
  (interactive)
  (mapc #'kill-buffer (magit-mode-get-buffers))
  (delete-other-windows))
(global-set-key (kbd "M-#") #'quit-magit)

(defun mark-whole-word (&optional arg allow-extend)
  "Like `mark-word', but selects whole words and skips over whitespace.
If you use a negative prefix arg then select words backward.
Otherwise select them forward.

If cursor starts in the middle of word then select that whole word.

If there is whitespace between the initial cursor position and the
first word (in the selection direction), it is skipped (not selected).

If the command is repeated or the mark is active, select the next NUM
words, where NUM is the numeric prefix argument.  (Negative NUM
selects backward.)"
  (interactive "P\np")
  (let ((num  (prefix-numeric-value arg)))
    (unless (eq last-command this-command)
      (if (natnump num)
          (skip-syntax-forward "\\s-")
        (skip-syntax-backward "\\s-")))
    (unless (or (eq last-command this-command)
                (if (natnump num)
                    (looking-at "\\b")
                  (looking-back "\\b")))
      (if (natnump num)
          (left-word)
        (right-word)))
    (mark-word arg allow-extend)))
(global-set-key [remap mark-word] 'mark-whole-word)

(defun cursor-color ()
  "Convenience to set the cursor color"
  (interactive)
  (set-cursor-color "#fc0fc0"))

(defun select-current-line ()
  "Select the entire line the cursor is on."
  (interactive)
  (set-mark (line-beginning-position))
  (goto-char (line-end-position)))
(global-set-key (kbd "C-S-l") #'select-current-line)

(defun open-shell-in-split-window ()
  "Open a terminal in a split window"
  (interactive)
  (let ((buf (eshell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))
(global-set-key (kbd "C-M-<return>") #'open-shell-in-split-window)

(defun copy-current-line ()
  "Copy the current line from begin to end"
  (interactive)
  (save-excursion
    (let ((beg (progn (beginning-of-line) (point)))
          (end (progn (end-of-line) (point))))
      (kill-ring-save beg end)
      (pulse-momentary-highlight-one-line))))
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
    (let ((beg (progn (beginning-of-line) (point)))
          (end (progn (end-of-line) (point))))
      (replace-string "_" " " nil beg end nil nil))))
(global-set-key (kbd "C-c C-x C-SPC") #'deundescore)

(defun accented ()
  "Easily inser an accented character"
 (interactive)
  (let* ((char-alist '((?a "á" "Á" "à" "À" "â" "Â" "ä" "Ä" "ã" "Ã" "å" "Å" "æ" "Æ" "ā" "Ā")
                       (?e "é" "É" "è" "È" "ê" "Ê" "ë" "Ë" "ē" "Ē")
                       (?i "í" "Í" "ì" "Ì" "î" "Î" "ï" "Ï" "ī" "Ī")
                       (?o "ó" "Ó" "ò" "Ò" "ô" "Ô" "ö" "Ö" "õ" "Õ" "ø" "Ø" "œ" "Œ" "ō" "Ō")
                       (?u "ü" "Ü" "ù" "Ù" "ú" "Ú" "û" "Û" "ū" "Ū")
                       (?c "ç" "Ç")
                       (?h "ḥ" "Ḥ")
                       (?n "ñ" "Ñ")
                       (?s "ß" "š" "Š" "ṣ" "Ṣ")
                       (?t "ṭ" "Ṭ")
                       (?z "ẓ" "Ẓ")))
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
