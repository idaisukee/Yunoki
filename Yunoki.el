(require 's)

(defvar Yunoki-path "/home/ieremius/prd/src/Yunoki.rb")
(defvar Yunoki-next-char-path (s-concat Yunoki-path "/next_char.rb"))
(defvar Yunoki-modern-char-path (s-concat Yunoki-path "/modern_char.rb"))

(defun Yunoki-next-char nil
    (interactive)
    (save-excursion
        (backward-char)
        (set-mark-command nil)
        (forward-char)
        (shell-command-on-region (region-beginning) (region-end) (s-concat "ruby " Yunoki-next-char-path) nil t))
    (forward-char))

(provide 'Yunoki)
