;; melpa source
(require 'package)
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))


;; set $PATH
;(setenv "PATH" (concat (getenv "PATH") ":" "/usr/local/Cellar/graphviz/2.40.1/bin:"
;		       "/Library/TeX/texbin"
;                       "/usr/local/bin/"))

(package-initialize)

;; ignore ring
(setq ring-bell-function 'ignore)

;; auto revert
(global-auto-revert-mode t)

;; backup files
(setq make-backup-files nil)

;; auto save
(setq auto-save-default nil)

;; recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; UTF-8 set for beorg
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")

;; delete the selection without cut
(delete-selection-mode 1)

;; space, instead of tab
(setq-default indent-tabs-mode nil)

;; auto pair
(electric-pair-mode t)

;; UI
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode 1)
(global-linum-mode t)
(toggle-frame-fullscreen)
(display-time-mode 1)
(column-number-mode 1)
(setq-default line-spacing 5)
(setq frame-title-format "%b  [%I] %f  GNU/Emacs" ) ;; windows title
(setq inhibit-splash-screen t) ;; startup interface

;; Theme
;(use-package dracula-theme)
;  :init (load-theme 'dracula t)
;  :ensure t)

(use-package zenburn-theme
  :init (load-theme 'zenburn t)
  :ensure t)

;; org UI
(setq org-startup-indented t)

;; org babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (python . t)
   (plantuml . t)
   ))

;; shutdown evaluate notice
(setq org-confirm-babel-evaluate nil)

;; font
(set-default-font "Dejavu Sans Mono 11")
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "WenQuanYi Micro Hei Mono" :size 11)))
;; For Table ,Font size: CN-18, EN-11

;; packages
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode)
  (use-package yasnippet-snippets :ensure t)
  )

(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/plantuml.jar"))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package org-re-reveal
  :ensure t
  :init
  (setq org-re-reveal-root "https://cdn.bootcss.com/reveal.js/3.8.0")
  :config
 (setq org-re-reveal-theme "Sky")
  ; Black/White/League/Sky/Beige/Simple/Serif/Blood/Night/Moon/Solarized
  (setq org-re-reveal-width 1200)
  (setq org-re-reveal-height 1000)
  (setq org-re-reveal-margin "0.1")
  (setq org-re-reveal-min-scale "0.5")
  (setq org-re-reveal-max-scale "2.5")
  (setq org-re-reveal-transition "cube")
  (setq org-re-reveal-plugins '(classList markdown zoom notes))
  (setq org-re-reveal-control t)
  (setq org-re-reveal-center t)
  (setq org-re-reveal-progress t)
  (setq org-re-reveal-history nil))

;; Use ag
; (add-to-list 'exec-path "/usr/local/bin/")


;; shortcut
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-;") 'switch-to-next-buffer)

;; set path, from echo $PATH within OS shell
(setenv "PATH"
        (concat
         (getenv "PATH")
         ":""/Library/TeX/texbin"
         ":""/opt/local/sbin"))

;------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-re-reveal doom-modeline yasnippet-snippets yasnippet magit use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
