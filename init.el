;; melpa source
(require 'package)
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))

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
(set-default-font "Dejavu Sans Mono 15")
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "WenQuanYi Micro Hei Mono" :size 18)))
;; For Table ,Font size: CN-18, EN-11. At mac, CN-18, EN-15

;; packages
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (use-package yasnippet-snippets :ensure t)
  )

;; PlantUML
(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/plantuml.jar"))

;; Company mode
(add-hook 'after-init-hook 'global-company-mode)

(setq python-shell-interpreter "/usr/local/bin/python3")
(setq-default tab-width 4)
(setq jedi:environment-root "jedi")

;; For Python

(use-package company-jedi             ;;; company-mode completion back-end for Python JEDI
  :config
  (setq jedi:environment-virtualenv (list (expand-file-name "~/.emacs.d/.python-environments/")))
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  (setq jedi:get-in-function-call-delay 0)
  (setq compandy-minimum-prefix-length 3)
  (setq company-tooltip-align-annotations t)
  (setq company-selection-wrap-around t)
  (defun config/enable-company-jedi ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'config/enable-company-jedi))


(use-package elpy
  :ensure t
  :commands elpy-enable
  :hook
  (python-mode . elpy-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Use ag
; (add-to-list 'exec-path "/usr/local/bin/")

;; shortcut
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-;") 'switch-to-next-buffer)

;; set path
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))


;;--------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-shell company-jedi elpy zenburn-theme yasnippet-snippets use-package magit auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
