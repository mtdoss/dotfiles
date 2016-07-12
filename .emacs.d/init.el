(require 'package)
(package-initialize)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)
(setq show-paren-delay 0)
(show-paren-mode 1)
(setq-default show-trailing-whitespace t)

(require 'smooth-scrolling)
(setq smooth-scroll-margin 1)

;;; scrollers
(global-set-key "\M-n" "\C-u1\C-v")
(global-set-key "\M-p" "\C-u1\M-v")

;; default size
;; initial window
(setq initial-frame-alist
      '(
        (width . 175) ; character
        (height . 50) ; lines
        ))


;OCAML
;; http://emacs.stackexchange.com/questions/12084/how-to-get-merlin-mode-to-work-in-emacs
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;https://github.com/realworldocaml/book/wiki/Installation-Instructions#editors
; (add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)

; ;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)
(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)
;; -- merlin setup ---------------------------------------

(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(require 'ocp-indent)
(require 'merlin)

(push (concat opam-share "/emacs/site-lisp") load-path) ; directory containing merlin.el
(autoload 'merlin-mode "merlin" "Merlin mode" t)
;; Enable Merlin for ML buffers
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)
(require 'auto-complete)
(add-hook 'tuareg-mode-hook 'auto-complete-mode)
(add-hook 'tuareg-mode-hook
          (lambda ()
            (setq-local indent-line-function 'ocp-indent-line)
            (setq-local indent-region-function 'ocp-indent-region)
            ))
; ;; So you can do it on a mac, where `C-<up>` and `C-<down>` are used
; ;; by spaces.
; (define-key merlin-mode-map
;   (kbd "C-c <up>") 'merlin-type-enclosing-go-up)
; (define-key merlin-mode-map
;   (kbd "C-c <down>") 'merlin-type-enclosing-go-down)
; (set-face-background 'merlin-type-face "#88FF44")

;; -- enable auto-complete -------------------------------
;; Not required, but useful along with merlin-mode
; (require 'auto-complete)
; (add-hook 'tuareg-mode-hook 'auto-complete-mode)
;; Add the opam lisp dir to the emacs load path
; (add-to-list
;  'load-path
;  (replace-regexp-in-string
;   "\n" "/share/emacs/site-lisp"
;   (shell-command-to-string "opam config var prefix")))
;
; (load "/Users/markdoss/.opam/system/share/emacs/site-lisp/tuareg-site-file")
; (add-to-list 'load-path "/Users/markdoss/.opam/system/share/emacs/site-lisp/")
;

(setq merlin-ac-setup t)

;; Use the opam installed utop
(setq utop-command "opam config exec -- utop -emacs")


;; this is all solarized
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
