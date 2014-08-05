(defun create-ruby-buffer ()
  (interactive)
  "~/program/rubyにr[%d].rbをfind-fileする"
  (require 'em-glob)
  (setq l (eshell-extended-glob "~/program/ruby/r*.rb"))
  (setq l (reverse (sort l 'string<)))
  (setq l (file-name-sans-extension (file-name-nondirectory (car l))))
  (setq l (substring l 1 5))               ; p143
  (setq l (string-to-int l))
  (setq l (+ l 1))
  (setq l (format "~/program/ruby/r%04d.rb" l))
  (find-file l))

(defun create-jruby-buffer ()
  (interactive)
  "~/program/rubyにr[%d].rbをfind-fileする"
  (require 'em-glob)
  (setq l (eshell-extended-glob "~/program/jruby/jr*.rb"))
  (setq l (reverse (sort l 'string<)))
  (setq l (file-name-sans-extension (file-name-nondirectory (car l))))
  (setq l (substring l 2 6))               ; p143
  (setq l (string-to-int l))
  (setq l (+ l 1))
  (setq l (format "~/program/jruby/jr%04d.rb" l))
  (find-file l))

;; hs-minor-modeでrubyのソースを折りたたむ
(add-hook 'ruby-mode-hook
          '(lambda()
            (hs-minor-mode 1)))

(let ((ruby-mode-hs-info
       '(ruby-mode
          "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
          "end"
          "\#"
          ruby-move-to-block
          nil)))
  (if (not (member ruby-mode-hs-info hs-special-modes-alist))
      (setq hs-special-modes-alist
            (cons ruby-mode-hs-info hs-special-modes-alist))))
(define-key global-map (kbd "C-c C-p") 'hs-toggle-hiding)
