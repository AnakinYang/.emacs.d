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

(setq python-shell-interpreter "/usr/local/bin/python3")



(use-package org-roam
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/org/")
      (org-roam-graph-executable "/usr/local/bin/dot")
      (org-roam-graph-viewer "/usr/local/bin/inkscape")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n j" . org-roam-jump-to-index)
               ("C-c n b" . org-roam-switch-to-buffer)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))))

;; ivy
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode))

;; org-download
(use-package org-download
  :after org
  :bind
  (:map org-mode-map
        (("s-y" . org-download-screenshot)
         ("s-Y" . org-download-yank)))
  :custom
  (org-download-image-dir "~/org/static/")
)

;; Use ag
; (add-to-list 'exec-path "/usr/local/bin/")

;; shortcut
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-;") 'switch-to-next-buffer)
(global-set-key (kbd "C-:") 'switch-to-prev-buffer)

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
 '(org-download-screenshot-method "screencapture -i %s")
 '(package-selected-packages
   (quote
    (org-download ivy org-roam zenburn-theme yasnippet-snippets use-package magit flycheck exec-path-from-shell elpy company-shell company-lsp company-jedi auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
