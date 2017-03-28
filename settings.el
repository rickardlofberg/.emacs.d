
(setq package-list '(elpy expand-region magit multiple-cursors))

;; Add packet archives
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))

 ;; Sort C - h  a command to sort by relevance
(setq apropos-sort-by-scores t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(setq inhibit-splash-screen t)

(menu-bar-mode t)
(tool-bar-mode -1)
(setq frame-title-format "Here be dragons..")
(load-theme 'wombat)

(toggle-frame-maximized)

(show-paren-mode)

(require 'linum)
(global-linum-mode 1)

(column-number-mode t)

(global-hl-line-mode 1)

(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(require 'iso-transl)

(require 'ido)
(ido-mode t)

(setq next-line-add-newlines t)

(global-set-key (kbd "C-ö") 'delete-backward-char) ;; Designed for a Swedish keyboard
(global-set-key (kbd "M-ö") 'backward-kill-word)  ;; Designed for a Swedish keyboard

(global-set-key (kbd "C-;") 'delete-backward-char) ;; Designed for a Swedish keyboard
(global-set-key (kbd "M-;") 'backward-kill-word)  ;; Designed for a Swedish keyboard

;; Multiple cursors
(require 'multiple-cursors)
(multiple-cursors-mode)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

(elpy-enable)

(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")

(add-hook 'elpy-mode-hook 
  (function (lambda ()
              (hs-minor-mode t))))

;; Adds an minimap to buffer
;; (minimap-mode)

(require 'org)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(add-hook 'org-mode-hook #'(lambda ()
                             (visual-line-mode)
                             (org-indent-mode)))

(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

(setq org-agenda-files (list "~/org/ideas.org"))

(setq org-todo-file (expand-file-name "~/Dropbox/todo.org"))

(setq org-default-notes-file (concat org-directory "~Dropbox/org/todo.org"))
(setq org-default-notes-file org-todo-file)

(setq org-deadline-warning-days 7)
(setq org-agenda-span (quote fortnight))
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
(setq org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
(setq org-agenda-todo-ignore-deadlines (quote all))
(setq org-agenda-todo-ignore-scheduled (quote all))
(setq org-agenda-sorting-strategy
  (quote
   ((agenda deadline-up priority-down)
    (todo priority-down category-keep)
    (tags priority-down category-keep)
    (search category-keep))))

(setq org-capture-templates
    '(("i" "Idea" entry
      (file+headline "~/Dropbox/org/ideas.org" "Idea")
      "* Idea: %?
            ")
     ("n" "Note" entry
      (file+headline "~/Dropbox/org/notes.org" "Notes")
      "* Note %?\n %i\n %u ")
     ("t" "Todo" entry
      (file+headline "~/Dropbox/org/todo.org" "Tasks")
      "* TODO [#B] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(global-hl-line-mode t)
 '(line-number-mode t)
 '(package-selected-packages
   (quote
    (visible-mark magit multiple-cursors lua-mode expand-region elpy)))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "gray20")))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh         . t)
   (js         . t)
   (emacs-lisp . t)
   (perl       . t)
   (scala      . t)
   (clojure    . t)
   (python     . t)
   (ruby       . t)
   (dot        . t)
   (css        . t)
   (plantuml   . t)))
