(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/conf/packages/yasnippet"               ;; 作成するスニペットはここに入る
        "~/.emacs.d/elpa/yasnippet-20131203.720/snippets"  ;; 最初から入っていたスニペット(省略可能)
        ))
(yas-global-mode 1)
;; 単語展開キーバインド (ver8.0から明記しないと機能しない)
;; (setqだとtermなどで干渉問題ありでした)
;; もちろんTAB以外でもOK 例えば "C-;"とか
(custom-set-variables '(yas-trigger-key "TAB"))
;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-c y i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用する
(define-key yas-minor-mode-map (kbd "C-c y n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-c y v") 'yas-visit-snippet-file)

;; helm
(require 'helm-config)
(require 'helm-ag)
(require 'helm-descbinds)
(helm-descbinds-mode)
; agのデフォルトのコマンドオプションを指定
; -nを消すとサブディレクトリも再帰的に検索します
(setq helm-ag-base-command "ag --nocolor --nogroup -n")

(global-set-key (kbd "C-;")    'helm-mini)
(global-set-key (kbd "M-x")    'helm-M-x)
(global-set-key (kbd "<f1> b") 'helm-descbinds)
(global-set-key (kbd "C-c o")  'helm-occur)
(global-set-key (kbd "C-c s")  'helm-ag)
(global-set-key (kbd "M-y")    'helm-show-kill-ring)

