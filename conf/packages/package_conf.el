;; カスタマイズ用

;; yaml-mode
(add-hook 'yaml-mode-hook
          (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
(defconst yaml-comment-re "\\(#.*\\)"
