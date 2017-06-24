(require 's)
(require 'sequential-command)

(defvar Yunoki-path "/home/ieremius/prd/src/Yunoki.rb")
(defvar Yunoki-next-char-path (s-concat Yunoki-path "/next_char.rb"))
(defvar Yunoki-modern-char-path (s-concat Yunoki-path "/modern_char.rb"))
(defvar Yunoki-index-path (s-concat Yunoki-path "/index.rb"))

(defun Yunoki-common (path)
    (interactive)
    (save-excursion
        (backward-char)
        (set-mark-command nil)
        (forward-char)
        (shell-command-on-region (region-beginning) (region-end) (s-concat "ruby " path) nil t))
    (forward-char))

(defun Yunoki-index nil
    (interactive)
    (let*
        (
            (path Yunoki-index-path))
        (save-excursion
            (backward-char)
            (set-mark-command nil)
            (forward-char)
            (shell-command-to-string
                (s-concat "echo '" (region-to-string (region-beginning) (region-end)) "' | ruby " path)))))

(defun Yunoki-modernp nil
    (if (equal Yunoki-index "0")
        t
        nil))
;;悪
;;驗 (princ (Yunoki-index))
(defun Yunoki-next-char nil
    (interactive)
    (Yunoki-common Yunoki-char-path))

(defun Yunoki-modern-char nil
    (interactive)
    (Yunoki-common Yunoki-modern-char-path))

(define-sequential-command Yunoki-dwim
    Yunoki-modern-char
    Yunoki-next-char
    Yunoki-next-char
    Yunoki-next-char
    Yunoki-next-char
    Yunoki-next-char
    Yunoki-next-char
    Yunoki-next-char
    Yunoki-next-char
    Yunoki-next-char
    Yunoki-next-char)

(provide 'Yunoki)
