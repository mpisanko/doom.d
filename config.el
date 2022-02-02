;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Practicalli John"
      user-mail-address "john@practical.li")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'visual)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; Practicalli Custom Content
(setq doom-leader-key "SPC"
      doom-localleader-key ",")

;; Start Emacs maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Disable line numbers for all modes except prog-mode-hook
(remove-hook! '(text-mode-hook conf-mode-hook)
              #'display-line-numbers-mode)

(setq doom-theme 'doom-gruvbox)

;; Configure Fonts
;; (setq doom-font (font-spec :family "Input Mono Narrow" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "Fira Sans") ; inherits `doom-font''s :size
;;       doom-unicode-font (font-spec :family "Input Mono Narrow" :size 12)
;;       doom-big-font (font-spec :family "Fira Mono" :size 19))


;; CIDER - Disable features to use LSP instead
;;
;; https://github.com/ericdallo/dotfiles/blob/master/.doom.d/config.el#L67-L76
;; (use-package! cider
;;   :after clojure-mode
;;   :config
;;   (setq cider-show-error-buffer t ;'only-in-repl
;;         cider-font-lock-dynamically nil ; use lsp semantic tokens
;;         cider-eldoc-display-for-symbol-at-point nil ; use lsp
;;         cider-prompt-for-symbol nil)
;;   (set-lookup-handlers! 'cider-mode nil) ; use lsp
;;   (add-hook 'cider-mode-hook (lambda () (remove-hook 'completion-at-point-functions #'cider-complete-at-point))) ; use lsp
;;   )

(use-package! cider
  :after clojure-mode
  :config
  (setq cider-font-lock-dynamically nil ; use lsp semantic tokens
        cider-eldoc-display-for-symbol-at-point nil ; use lsp
        cider-prompt-for-symbol nil)
  (set-lookup-handlers! 'cider-mode nil) ; use lsp
  (add-hook 'cider-mode-hook (lambda () (remove-hook 'completion-at-point-functions #'cider-complete-at-point))) ; use lsp
  )
