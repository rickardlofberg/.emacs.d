# emacs.d

* Get packages
#+BEGIN_SRC emacs-lisp
;; Add packet archives
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))

 ;; Sort C - h  a command to sort by relevance
(setq apropos-sort-by-scores t)
#+END_SRC
* Style

Here are all the changes that make some change to the apperance of Emacs.

** Disable the splash screen (starting screen)

#+BEGIN_SRC emacs-lisp
(setq inhibit-splash-screen t)
#+END_SRC

** Hide the menu and toolbar; set the title and load theme
To hide the menu change =t= to =-1= and vise-versa for toolbar.
To change the text in top left corner, change the text between the quotation marks.

#+BEGIN_SRC emacs-lisp
(menu-bar-mode t)
(tool-bar-mode -1)
(setq frame-title-format "Here be dragons..")
(load-theme 'wombat)
#+END_SRC

** Start in maximized window mode

I prefer Emacs to launch in full screen

#+BEGIN_SRC emacs-lisp
(toggle-frame-maximized)
#+END_SRC

** Highlight parethesis

This makes programing a lot easier.

#+BEGIN_SRC emacs-lisp
(show-paren-mode)
#+END_SRC
 
** Line numbers

This makes sure that the linenumbers are always shown..

#+BEGIN_SRC emacs-lisp
(require 'linum)
(global-linum-mode 1)
#+END_SRC

** Display column number

Good to keep track of how wide I've written, for example when coding.

#+BEGIN_SRC emacs-lisp
(column-number-mode t)
#+END_SRC

** Highlight line

Highlight the line which the pointer is at.

#+BEGIN_SRC emacs-lisp
(global-hl-line-mode 1)
#+END_SRC

** Not sorted things

These are some other settings which I haven't sorted into categories yet.

#+BEGIN_SRC emacs-lisp
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
#+END_SRC
* Comfort of Life

This section contain some small things which makes my emacs experience much more pleasent

** Delete and replace region when typing

If something is covered between point and mark, it gets deleted once I start typing.

#+BEGIN_SRC emacs-lisp
(delete-selection-mode 1)
#+END_SRC

** No more yes or no

This replaces the question yes or no with y or n so I don't have to write yes and no.

#+BEGIN_SRC emacs-lisp
(fset 'yes-or-no-p 'y-or-n-p)
#+END_SRC

** Writing /tilde/ on Swedish keyboard
 
This should fix Tilde problem (can't be typed) for Swedish keyboard layouts.

#+BEGIN_SRC emacs-lisp
(require 'iso-transl)
#+END_SRC

** IDO-Mode (find files quickly)

Enables IDO-mode which makes it easier to find and open files in the system. When you for example use =C-c C-f= (find file) or =C-c C-b= (switch buffer) it will autocomplete.

#+BEGIN_SRC emacs-lisp
(require 'ido)
(ido-mode t)
#+END_SRC

** Automatic newlines

Add newline with C-n if at end of buffer, otherwise you have to press RET.

#+BEGIN_SRC emacs-lisp
(setq next-line-add-newlines t)
#+END_SRC

* Keyboard rebindings
** Backward delete
Never ever use backspace again, there are two settings below, both at the same key but for different layouts, UK and Swedish.

#+BEGIN_SRC emacs-lisp
(global-set-key (kbd "C-ö") 'delete-backward-char) ;; Designed for a Swedish keyboard
(global-set-key (kbd "M-ö") 'backward-kill-word)  ;; Designed for a Swedish keyboard

(global-set-key (kbd "C-;") 'delete-backward-char) ;; Designed for a Swedish keyboard
(global-set-key (kbd "M-;") 'backward-kill-word)  ;; Designed for a Swedish keyboard
#+END_SRC

** Multiple Cursors

Use multiple cursors to edit at several places at once. =C->= will the next matching region (of what is currently highlighted), =C-<= will do the same but look backwards in the document.
=C-c m c= will create cursors for the whole marked region.

#+BEGIN_SRC emacs-lisp
;; Multiple cursors
(require 'multiple-cursors)
(multiple-cursors-mode)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
#+END_SRC

* Coding
** Elpy mode

Enable Elpy-mode.

#+BEGIN_SRC emacs-lisp
(elpy-enable)
#+END_SRC

Change default interpretor to python3.

#+BEGIN_SRC emacs-lisp
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
#+END_SRC

** Expand/Collapse region

This is used for code-folding, it should detect segments and then fold/unfold it by using =C-@=.

#+BEGIN_SRC 
;; Expand region
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)
#+END_SRC

* Not active

Currently not using minimap-mode
#+BEGIN_SRC emacs-lisp
;; Adds an minimap to buffer
;; (minimap-mode)
#+END_SRC
* ORG Mode
** Need org-mode

Make sure that we have org-mode installed.

#+BEGIN_SRC emacs-lisp 
(require 'org)
#+END_SRC
** Global shortcuts

These are the global shortcuts which we want to be accessable from everywhere.
=C-c l= shortcut which saves a a link to current document which can later be inserted in an org document with the command =C-c C-o=.
=C-c a= show the agenda.
=C-c c= opens the capture menu to add different tasks such as tasks, ideas or TODO's.
=C-c b= switch between org-buffers.

#+BEGIN_SRC emacs-lisp
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
#+END_SRC
** Options for TODO tasks

These are the options you can cycle through for the TODO items.

#+BEGIN_SRC emacs-lisp
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
#+END_SRC
** Org-mode text wrapping

This makes the text wrap at the end of emcas windows.

#+BEGIN_SRC emacs-lisp
(add-hook 'org-mode-hook #'(lambda ()
                             (visual-line-mode)
                             (org-indent-mode)))
#+END_SRC

** Set priority numbering and their colours

The three priorety are A,B and C with A being the highest and default. Below is the colour and looks for each of the prioreties.

#+BEGIN_SRC emacs-lisp
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))
#+END_SRC

** Set agenda files

Agenda

#+BEGIN_SRC emacs-lisp
(setq org-agenda-files (list "~/org/ideas.org"))
#+END_SRC

TODO

#+BEGIN_SRC emacs-lisp
(setq org-todo-file (expand-file-name "~/Dropbox/todo.org"))
#+END_SRC
** Set capture file

This is a file to capture notes.

#+BEGIN_SRC emacs-lisp
(setq org-default-notes-file (concat org-directory "~Dropbox/org/todo.org"))
(setq org-default-notes-file org-todo-file)
#+END_SRC

** Agenda view settings
#+BEGIN_SRC emacs-lisp
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
#+END_SRC

** Set capture templates

These are the tempplates for saving ideas. There are three options, ideas, notes and TODOs.

#+BEGIN_SRC emacs-lisp
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
#+END_SRC
