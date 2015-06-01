;;; 初期設定ファイルの指定
(setq user-init-file "~/.emacs.d/init.el")

;;; すでにキーバインドが定義されてるものを
;;; M-x で呼んだ場合に、キーバインドを教えてくれる設定
(setq suggest-key-bindings t)

;;; 起動画面を表示しないようにする.
(setq inhibit-startup-message t)     ; 起動画面の抑制

;;; yes-noをy-nで入力できるように.
(defalias 'yes-or-no 'y-or-n-p)

(setq load-path (cons "~/.emacs.d/elisp" load-path))

(setq load-path (cons "~/.emacs.d/site-lisp" load-path))

;; skkのパス
(setq load-path (cons "~/.emacs.d/site-lisp/skk" load-path))
;; foregin-regexpのパス
(setq load-path (cons "~/.emacs.d/site-lisp/foreign-regexp" load-path))
;; ghのパス
(setq load-path (cons "~/.emacs.d/site-lisp/gh" load-path))
;; helmのパス
(setq load-path (cons "~/.emacs.d/site-lisp/helm" load-path))
;; helm-migemoのパス
(setq load-path (cons "~/.emacs.d/site-lisp/helm-migemo" load-path))
;; anythingのパス
(setq load-path (cons "~/.emacs.d/site-lisp/anything" load-path))
;; smartrepのパス
(setq load-path (cons "~/.emacs.d/site-lisp/smartrep" load-path))
;; cl-libのパス
(setq load-path (cons "~/.emacs.d/site-lisp/cl-lib" load-path))
;; highlight-symbolのパス
(setq load-path (cons "~/.emacs.d/site-lisp/highlight-symbol" load-path))
;; multiple-cursorsのパス
(setq load-path (cons "~/.emacs.d/site-lisp/multiple-cursors" load-path))
;; recentf-extのパス
(setq load-path (cons "~/.emacs.d/site-lisp/recentf-ext" load-path))
;; anzuのパス
(setq load-path (cons "~/.emacs.d/site-lisp/anzu" load-path))
;; yasnippetのパス
(setq load-path (cons "~/.emacs.d/site-lisp/yasnippet" load-path))
;; yatexのパス
(setq load-path (cons "~/.emacs.d/site-lisp/yatex" load-path))
;; emmsのパス
(setq load-path (cons "~/.emacs.d/site-lisp/emms/lisp/" load-path))
;; robeのパス
(setq load-path (cons "~/.emacs.d/site-lisp/robe" load-path))
;; el-getのパス
(setq load-path (cons "~/.emacs.d/site-lisp/el-get" load-path))
;; sdicのパス
(setq load-path (cons "~/.emacs.d/site-lisp/sdic" load-path))


;; パスの共有
(load-file (expand-file-name "~/.emacs.d/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))

;;; Emacsのパッケージ管理.
;;; 詳しくは以下のサイトに記載されている.
;;; http://d.hatena.ne.jp/tarao/20150221/1424518030
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))


;;; init-loader.elで設定ファイルを分割管理.
;;;
;; http://shibayu36.hatenablog.com/entry/20101229/1293624201
;; (install-elisp "https://raw.githubusercontent.com/emacs-jp/init-loader/master/init-loader.el")
(require 'init-loader nil t)
(init-loader-load "~/.emacs.d/inits")
