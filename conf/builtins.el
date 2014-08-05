;; 標準Elispの設定

;; 自動でスペルチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")

;; emacs-lisp-modeでバッファーを開いたときに行う設定
(add-hook
 'emacs-lisp-mode-hook
 (lambda ()
   ;; スペースでインデントをする
   (setq indent-tabs-mode nil)))

;; css-modeの設定
(require 'css-mode)
(setq css-indent-offset 2)

;; server-start
(require 'server)
(unless (server-running-p)
  (server-start))


;; ;; filecache
;; ;; ディレクトリを指定せずにファイル名のみで開くことが出来る
;; ;; 使い方
;; ;; C-x C-f から
;; ;; ファイル名を入力→C-c C-i
;; (require 'filecache)
;; (file-cache-add-directory-list
;;  (list "~/.emacs.d/conf/"))		;ディレクトリの追加
;; (file-cache-add-file-list
;;  (list "~/.zshrc"))			;ファイルを追加
;; (define-key minibuffer-local-completion-map (kbd "C-c C-i")
;;   'file-cache-minibuffer-complete)

;; cua-modoの編集
(setq cua-enable-cua-keys nil)          ;cuaのキーバインドを無効に
