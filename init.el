;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(require 'cl)
(require 'flymake)

(unless (window-system)
    (progn
      )
    )
(if (window-system)
    (progn
      ;; ロードパスの追加
      (add-to-list 'load-path "~/.emacs.d/conf/packages")
      (add-to-list 'load-path "~/.emacs.d/conf/buildins")
      (add-to-list 'load-path "~/.emacs.d/conf")
      (add-to-list 'load-path "~/.emacs.d/")

      ;; Localeに合わせた環境の設定
      (set-locale-environment nil)
      (prefer-coding-system 'utf-8)

      ;; yes/noをy/nに変更
      (fset 'yes-or-no-p 'y-or-n-p)

      ;; Welcom画面を非表示
      (setq inhibit-startup-screen t)         ; inhibit妨げる

      ;; カラム番号も表示
      (column-number-mode t)

      ;; commandをmeta keyに
      (setq ns-command-modifier (quote meta))
      (setq ns-alternate-modifier (quote super))

      ;; defaultでタブを使わない。代わりのスペースを２個いれる
      (setq-default tab-width 2)
      (setq-default indent-tabs-mode nil)

      ;; C-hでバックスペース
      (keyboard-translate ?\C-h ?\C-?)

      ;; 基本
      (define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
                                        ;(define-key global-map (kbd "C-z") 'undo)                ; undo
      (define-key global-map (kbd "C-c i") 'indent-region)      ; インデント
                                        ;(global-set-key (kbd "C-c C-i") 'hippie-expand)          ; 補完
      (global-set-key (kbd "M-;") 'comment-dwim)                ; コメントアウト
      (global-set-key (kbd "M-C-g") 'grep)                      ; grep
      (global-set-key (kbd "M-g") 'goto-line)                   ; 指定行へ移動
      (global-set-key (kbd "M-t") 'other-window)                ; ウィンドウの移動
      (global-set-key (kbd "C-c r") 'query-replace)             ; M-%のかわり
      (global-set-key "\C-m" 'newline-and-indent)     ; 改行と同時にインデント
      (global-set-key [?¥] [?\\])                     ; ¥を\に変える

      ;; 文中に改行
      (defun endline-and-newline-and-indent ()
        (interactive)
        (end-of-line)
        (newline-and-indent))
      (global-set-key (kbd "S-<return>") 'endline-and-newline-and-indent)

      ;; メニューバーを消す
      (menu-bar-mode -1)
      ;; ツールバーを消す
      (tool-bar-mode -1)

      ;; カーソルの点滅を止める
      (blink-cursor-mode 0)

      ;; evalした結果を全部表示
      (setq eval-expression-print-length nil)

      ;; 対応する括弧を光らせる。
      (show-paren-mode 1)
      ;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
      (setq show-paren-style 'mixed)

      ;; 空白や長すぎる行を視覚化する。
      (require 'whitespace)
                                        ; 1行が100桁を超えたら長すぎると判断する。
      (setq whitespace-line-column 100)
      (setq whitespace-style '(face              ; faceを使って視覚化する。
                               trailing          ; 行末の空白を対象とする。
                               lines-tail        ; 長すぎる行のうち
                                        ; whitespace-line-column以降のみを
                                        ; 対象とする。
                               space-before-tab  ; タブの前にあるスペースを対象とする。
                               space-after-tab   ; タブの後にあるスペースを対象とする。
                                        ;                         spaces
                               newline
                               ))
      ;; デフォルトで視覚化を有効にする。
      (global-whitespace-mode t)

      ;; 現在行を目立たせる
      (global-hl-line-mode)

      ;; カーソルの位置が何文字目かを表示する
      (column-number-mode t)

      ;; カーソルの位置が何行目かを表示する
      (line-number-mode t)

      ;; カーソルの場所を保存する
      (require 'saveplace)
      (setq-default save-place t)
      (setq save-place-file "~/.emacs.d/conf/builtins/.emacs-places")

      ;; 行の先頭でC-kを一回押すだけで行全体を消去する
      (setq kill-whole-line t)

      ;; 最終行に必ず一行挿入する
      (setq require-final-newline t)

      ;; バッファの最後でnewlineで新規行を追加するのを禁止する
      (setq next-line-add-newlines nil)

      ;; バックアップファイルの作成場所を変更
      (add-to-list 'backup-directory-alist
                   (cons "." "~/.emacs.d/backups/"))
      ;;　オートセーブファイルの作成場所を変更
      (setq auto-save-file-name-transforms
            `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

      ;; 終了時にオートセーブファイルを消す
      (setq delete-auto-save-files t)

      ;; 補完時に大文字小文字を区別しない
      (setq completion-ignore-case t)
      (setq read-file-name-completion-ignore-case t)

      ;; 部分一致の補完機能を使う
      ;; p-bでprint-bufferとか
                                        ; (partial-completion-mode t)

      ;; 補完可能なものを随時表示
      ;; 少しうるさい
                                        ;(icomplete-mode 1)

      ;; 履歴数を大きくする
      (setq history-length 10000)

      ;; ミニバッファの履歴を保存する
      (savehist-mode 1)

      ;; 最近開いたファイルを保存する数を増やす
      (setq recentf-max-saved-items 10000)

      ;; 現在のウィンドウの上部に関数名を表示
      (which-function-mode t)

      ;; 終了時にオートセーブファイルを消す
      (setq delete-auto-save-files t)

      ;; フォントの設定
      (set-face-attribute 'default nil
                          :family "Menlo" ;; font
                          :height 120)    ;; font size
      (set-fontset-font
       nil 'japanese-jisx0208
       (font-spec :family "Hiragino Mincho Pro"))
      ;; フォント幅調整
      (setq face-font-rescale-alist
            '((".*Hiragino_Mincho_Pro.*" . 1.2)))
      ;; (set-face-foreground 'font-lock-comment-face "grey44")
      (set-face-foreground 'font-lock-comment-delimiter-face "grey44")
      ;; フォントテスト
      ;; ------------------------------
      ;; |  0123456789012345678901234 |
      ;; |  abcdefghijklnmopqrstuvwxy |
      ;; |　あいうえおかきくけこさしす |
      ;; | ０１２３４５６７８９０１２ |
      ;; ------------------------------

      ;; フレームの設定
      (setq initial-frame-alist
            (append'((top    .22)
                     (left   .600)
                     (width  .104)
                     (height .50))
                   initial-frame-alist))

      ;; 標準Elispの設定
      (load "builtins")

      ;; 非標準Elispの設定
      (load "packages")

      ;; カスタマイズ用elisp
      (load "local")

      ;; M-x customizeで自動で設定されるElisp
      ))
