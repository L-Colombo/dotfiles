;; CUSTOM FUNCTIONS

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
  (beginning-of-line)
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
    (let ((beg (point)))
      (replace-region-contents beg (beginning-of-line)
                               (query-replace "_" " ")))))
(global-set-key (kbd "C-c C-x SPC") #'deundescore)

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
