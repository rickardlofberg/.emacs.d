<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Get packages</a>
<ul>
<li><a href="#sec-1-1">1.1. List of packages</a></li>
<li><a href="#sec-1-2">1.2. Archives used</a></li>
<li><a href="#sec-1-3">1.3. Initialise</a></li>
<li><a href="#sec-1-4">1.4. Fetch packages</a></li>
<li><a href="#sec-1-5">1.5. Install packages</a></li>
</ul>
</li>
<li><a href="#sec-2">2. Style</a>
<ul>
<li><a href="#sec-2-1">2.1. Disable the splash screen (starting screen)</a></li>
<li><a href="#sec-2-2">2.2. Hide the menu and toolbar; set the title and load theme</a></li>
<li><a href="#sec-2-3">2.3. Start in maximised window mode</a></li>
<li><a href="#sec-2-4">2.4. Highlight parenthesis</a></li>
<li><a href="#sec-2-5">2.5. Line numbers</a></li>
<li><a href="#sec-2-6">2.6. Display column number</a></li>
<li><a href="#sec-2-7">2.7. Highlight line</a></li>
</ul>
</li>
<li><a href="#sec-3">3. Comfort of Life</a>
<ul>
<li><a href="#sec-3-1">3.1. Delete and replace region when typing</a></li>
<li><a href="#sec-3-2">3.2. No more yes or no</a></li>
<li><a href="#sec-3-3">3.3. Writing <i>tilde</i> on Swedish keyboard</a></li>
<li><a href="#sec-3-4">3.4. IDO-Mode (find files quickly)</a></li>
<li><a href="#sec-3-5">3.5. Automatic newlines</a></li>
</ul>
</li>
<li><a href="#sec-4">4. Keyboard rebinding</a>
<ul>
<li><a href="#sec-4-1">4.1. Backward delete</a></li>
<li><a href="#sec-4-2">4.2. Multiple Cursors</a></li>
</ul>
</li>
<li><a href="#sec-5">5. Coding</a>
<ul>
<li><a href="#sec-5-1">5.1. Elpy mode</a></li>
<li><a href="#sec-5-2">5.2. Expand/Collapse region</a></li>
</ul>
</li>
<li><a href="#sec-6">6. Not active</a></li>
<li><a href="#sec-7">7. Org-mode</a>
<ul>
<li><a href="#sec-7-1">7.1. Need org-mode</a></li>
<li><a href="#sec-7-2">7.2. Global shortcuts</a></li>
<li><a href="#sec-7-3">7.3. Options for TODO tasks</a></li>
<li><a href="#sec-7-4">7.4. Org-mode text wrapping</a></li>
<li><a href="#sec-7-5">7.5. Set priority numbering and their colours</a></li>
<li><a href="#sec-7-6">7.6. Set agenda files</a></li>
<li><a href="#sec-7-7">7.7. Set capture file</a></li>
<li><a href="#sec-7-8">7.8. Agenda view settings</a></li>
<li><a href="#sec-7-9">7.9. Set capture templates</a></li>
</ul>
</li>
<li><a href="#sec-8">8. Not sorted things</a></li>
</ul>
</div>
</div>

# Get packages<a id="sec-1" name="sec-1"></a>

## List of packages<a id="sec-1-1" name="sec-1-1"></a>

These are all the non built-in packages which are used in this build.

    (setq package-list '(elpy expand-region magit multiple-cursors))

## Archives used<a id="sec-1-2" name="sec-1-2"></a>

Use [ELPA](https://elpa.gnu.org/) and [MELPA](https://melpa.org/#/) archives for packages.

    ;; Add packet archives
    (setq package-archives
          '(("gnu" . "http://elpa.gnu.org/packages/")
            ("melpa" . "http://melpa.org/packages/")))
    
     ;; Sort C - h  a command to sort by relevance
    (setq apropos-sort-by-scores t)

## Initialise<a id="sec-1-3" name="sec-1-3"></a>

Make sure that the archives are available.

    (package-initialize)

## Fetch packages<a id="sec-1-4" name="sec-1-4"></a>

Fetch all the packages which are needed.

    (unless package-archive-contents
      (package-refresh-contents))

## Install packages<a id="sec-1-5" name="sec-1-5"></a>

This will install all the packages which are not installed.

    (dolist (package package-list)
      (unless (package-installed-p package)
        (package-install package)))

# Style<a id="sec-2" name="sec-2"></a>

Here are all the changes that make some change to the appearance of Emacs.

## Disable the splash screen (starting screen)<a id="sec-2-1" name="sec-2-1"></a>

No need to have the starting screen. However, if you like it you can comment this line out with `;;` at the beginning or by just removing it.

    (setq inhibit-splash-screen t)

## Hide the menu and toolbar; set the title and load theme<a id="sec-2-2" name="sec-2-2"></a>

To hide the menu change `t` to `-1` and vise-versa for toolbar. To change the text in top left corner, change the text between the quotation marks. The theme can also be changed I would recommend you type `M-x` and then `customize-themes` to find a theme which you like and then change the text to that theme.

    (menu-bar-mode t)
    (tool-bar-mode -1)
    (setq frame-title-format "Here be dragons..")
    (load-theme 'wombat)

## Start in maximised window mode<a id="sec-2-3" name="sec-2-3"></a>

I prefer Emacs to launch in full screen, either delete or comment this out if you don't like this option.

    (toggle-frame-maximized)

## Highlight parenthesis<a id="sec-2-4" name="sec-2-4"></a>

This makes programming a lot easier, basically it highlights (), {} and []. It might do some more but these are the ones I benefit from.

    (show-paren-mode)

## Line numbers<a id="sec-2-5" name="sec-2-5"></a>

This makes sure that the line numbers are always shown. Makes it easier to use command such as `M-g M-g` and then typing the line you want to go to.

    (require 'linum)
    (global-linum-mode 1)

## Display column number<a id="sec-2-6" name="sec-2-6"></a>

Good to keep track of how wide I've written, for example when coding.

    (column-number-mode t)

## Highlight line<a id="sec-2-7" name="sec-2-7"></a>

Highlight the line which the pointer is at. Very useful to quickly find the point. The colour is also changed to make it easier to find the point. The cursor is also made orange to be easier to find in a document.

    (global-hl-line-mode 1)
    (set-face-background hl-line-face "DeepSkyBlue4")
    (set-cursor-color "sienna2")

# Comfort of Life<a id="sec-3" name="sec-3"></a>

This section contain some small things which makes my emacs experience much more pleasant.

## Delete and replace region when typing<a id="sec-3-1" name="sec-3-1"></a>

If something is covered between point and mark, it gets deleted once I start typing.

    (delete-selection-mode 1)

## No more yes or no<a id="sec-3-2" name="sec-3-2"></a>

This replaces the question yes or no with y or n so I don't have to write yes and no.

    (fset 'yes-or-no-p 'y-or-n-p)

## Writing *tilde* on Swedish keyboard<a id="sec-3-3" name="sec-3-3"></a>

This should fix Tilde problem (can't be typed) for Swedish keyboard layouts.

    (require 'iso-transl)

## IDO-Mode (find files quickly)<a id="sec-3-4" name="sec-3-4"></a>

Enables IDO-mode which makes it easier to find and open files in the system. When you for example use `C-c C-f` (find file) or `C-c C-b` (switch buffer) it will auto-complete.

    (require 'ido)
    (ido-mode t)

## Automatic newlines<a id="sec-3-5" name="sec-3-5"></a>

Add newline with `C-n` if at end of buffer, otherwise you have to press RET.

    (setq next-line-add-newlines t)

# Keyboard rebinding<a id="sec-4" name="sec-4"></a>

## Backward delete<a id="sec-4-1" name="sec-4-1"></a>

Never ever use backspace again, there are two settings below, both at the same key but for different layouts, UK and Swedish.

    (global-set-key (kbd "C-ö") 'delete-backward-char) ;; Designed for a Swedish keyboard
    (global-set-key (kbd "M-ö") 'backward-kill-word)  ;; Designed for a Swedish keyboard
    
    (global-set-key (kbd "C-;") 'delete-backward-char) ;; Designed for a UK keyboard (Cred: Christian for correction)
    (global-set-key (kbd "M-;") 'backward-kill-word)  ;; Designed for a UK keyboard (Cred: Christian for correction)

## Multiple Cursors<a id="sec-4-2" name="sec-4-2"></a>

Use multiple cursors to edit at several places at once. `C->` will the next matching region (of what is currently highlighted), `C-<` will do the same but look backwards in the document.
`C-c m c` will create cursors for the whole marked region.

    ;; Multiple cursors
    (require 'multiple-cursors)
    (multiple-cursors-mode)
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
    (global-set-key (kbd "C-c m c") 'mc/edit-lines)

# Coding<a id="sec-5" name="sec-5"></a>

## Elpy mode<a id="sec-5-1" name="sec-5-1"></a>

Enable Elpy-mode.

    (elpy-enable)

Change default interpreter to python3.

    (setq elpy-rpc-python-command "python3")
    (setq python-shell-interpreter "python3")

## Expand/Collapse region<a id="sec-5-2" name="sec-5-2"></a>

This is used for code-folding, it should detect segments and then fold/unfold it by using `C-@ C/c` and only in Elpy-mode.

    (add-hook 'elpy-mode-hook 
      (function (lambda ()
                  (hs-minor-mode t))))

    ;; Expand region
    ;; (require 'expand-region)
    ;; (global-set-key (kbd "C-@") 'er/expand-region)

# Not active<a id="sec-6" name="sec-6"></a>

Currently not using minimap-mode

    ;; Adds an minimap to buffer
    ;; (minimap-mode)

# Org-mode<a id="sec-7" name="sec-7"></a>

## Need org-mode<a id="sec-7-1" name="sec-7-1"></a>

Make sure that we have org-mode installed.

    (require 'org)

## Global shortcuts<a id="sec-7-2" name="sec-7-2"></a>

These are the global shortcuts which we want to be accessible from everywhere.
`C-c l` shortcut which saves a a link to current document which can later be inserted in an org document with the command `C-c C-o`.
`C-c a` show the agenda.
`C-c c` opens the capture menu to add different tasks such as tasks, ideas or TODO's.
`C-c b` switch between org-buffers.

    (global-set-key "\C-cl" 'org-store-link)
    (global-set-key "\C-ca" 'org-agenda)
    (global-set-key "\C-cc" 'org-capture)
    (global-set-key "\C-cb" 'org-iswitchb)

## Options for TODO tasks<a id="sec-7-3" name="sec-7-3"></a>

These are the options you can cycle through for the TODO items.

    (setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

## Org-mode text wrapping<a id="sec-7-4" name="sec-7-4"></a>

This makes the text wrap at the end of emacs windows.

    (add-hook 'org-mode-hook #'(lambda ()
                                 (visual-line-mode)
                                 (org-indent-mode)))

## Set priority numbering and their colours<a id="sec-7-5" name="sec-7-5"></a>

The three priority are A,B and C with A being the highest and default. Below is the colour and looks for each of the priorities.

    (setq org-highest-priority ?A)
    (setq org-lowest-priority ?C)
    (setq org-default-priority ?A)
    (setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                               (?B . (:foreground "LightSteelBlue"))
                               (?C . (:foreground "OliveDrab"))))

## Set agenda files<a id="sec-7-6" name="sec-7-6"></a>

Agenda

    (setq org-agenda-files (list "~/org/ideas.org"))

TODO

    (setq org-todo-file (expand-file-name "~/Dropbox/todo.org"))

## Set capture file<a id="sec-7-7" name="sec-7-7"></a>

This is a file to capture notes.

    (setq org-default-notes-file (concat org-directory "~Dropbox/org/todo.org"))
    (setq org-default-notes-file org-todo-file)

## Agenda view settings<a id="sec-7-8" name="sec-7-8"></a>

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

## Set capture templates<a id="sec-7-9" name="sec-7-9"></a>

These are the templates for saving ideas. There are three options, ideas, notes and TODOs.

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

# Not sorted things<a id="sec-8" name="sec-8"></a>

These are some other settings which I haven't sorted into categories yet.

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
