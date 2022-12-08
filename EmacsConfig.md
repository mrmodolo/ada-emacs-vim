# Eglot

[Eglot for Better Programming Experience in Emacs](https://whatacold.io/blog/2022-01-22-emacs-eglot-lsp/)


## M-x Eglot

Emacs Polyglot is the Emacs LSP client that stays out of your way:

https://github.com/joaotavora/eglot

** Eglot works with the built-in completion-at-point function as well, which is usually bound to C-M-i **

## company

https://elpa.gnu.org/packages/company.html

## Eglot: The Emacs Client for the Language Server Protocol

https://joaotavora.github.io/eglot/

Documentação completa com todas as teclas

```lisp
(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (defgroup project-build nil
    "LSP options for Project"
    :group 'ada-mode)

  (defcustom project-build-type "Debug"
    "Controls the type of build of a project.
   Default is Debug, other choices are Release and Coverage."
    :type '(choice
            (const "Debug")
            (const "Coverage")
            (const "Release"))
    :group 'project-build)

  (require 'eglot)
  (define-key eglot-mode-map (kbd "C-c <ESC>") #'company-complete) ; initiate the completion manually
  (define-key eglot-mode-map (kbd "C-c e f n") #'flymake-goto-next-error)
  (define-key eglot-mode-map (kbd "C-c e f p") #'flymake-goto-prev-error)
  (define-key eglot-mode-map (kbd "C-c e r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c e =") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c e +") #'eglot-format-buffer)
  (define-key eglot-mode-map (kbd "C-c e c a") #'eglot-ations)
  (define-key eglot-mode-map (kbd "C-c e c o") #'eglot-ations-organize-imports)
  (define-key eglot-mode-map (kbd "C-c e c q") #'eglot-ations-quickfix)
  (define-key eglot-mode-map (kbd "C-c e c e") #'eglot-ations-extract)
  (define-key eglot-mode-map (kbd "C-c e c i") #'eglot-ations-inline)
  (define-key eglot-mode-map (kbd "C-c e c r") #'eglot-ations-rewrite)


  ;;(add-hook 'ada-mode-hook 'lsp)

  (add-hook 'ada-mode-hook 'eglot-ensure)
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
               '(ada-mode . ("/home/modolo/opt/GNAT/2021/libexec/gnatstudio/als/ada_language_server"))))

  (add-hook 'ada-mode-hook 'company-mode)

  (with-eval-after-load 'ada-mode

        (setenv "PATH" (concat  "/home/modolo/opt/GNAT/2021/bin:/home/modolo/opt/GNAT/2021/libexec/gnatstudio/als:" (getenv "PATH")))
        (setq exec-path (append '("/home/modolo/opt/GNAT/2021/bin" "/home/modolo/opt/GNAT/2021/libexec/gnatstudio/als" ) exec-path))

        (setq-default indent-tabs-mode nil)

        (define-key xref--transient-buffer-mode-map (kbd "RET") 'xref-goto-xref)
        
        (setq xref-prompt-for-identifier nil) ;; only prompt on C-u
        
        (setq xref-show-xrefs-function #'xref--show-defs-buffer-at-bottom)
        
        (setq xref-show-definitions-function #'xref--show-defs-buffer-at-bottom)
        
        (electric-pair-mode 1)
        
        (require 'imenu) ;; also enables speedbar
        
        (add-to-list 'hippie-expand-try-functions-list 'wisi-skel-hippie-try)
        
        (define-key ada-mode-map "\C-e"     'hippie-expand)
        
        (define-key ada-mode-map [down-mouse-3] 'ada-popup-menu)
        
        (add-hook 'ada-mode-hook
           (lambda ()
            (add-hook 'before-save-hook 'delete-trailing-whitespace nil t)
            (add-hook 'before-save-hook 'copyright-update nil t)
            (add-hook 'before-save-hook
                      (lambda () (untabify (point-min) (point-max)))
                       nil t)))
  )
)
```

```lisp
(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  (require 'eglot)
  (define-key eglot-mode-map (kbd "C-c <ESC>") #'company-complete) ; initiate the completion manually
  (define-key eglot-mode-map (kbd "C-c e f n") #'flymake-goto-next-error)
  (define-key eglot-mode-map (kbd "C-c e f p") #'flymake-goto-prev-error)
  (define-key eglot-mode-map (kbd "C-c e r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c e =") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c e +") #'eglot-format-buffer)
  (define-key eglot-mode-map (kbd "C-c e c a") #'eglot-ations)
  (define-key eglot-mode-map (kbd "C-c e c o") #'eglot-ations-organize-imports)
  (define-key eglot-mode-map (kbd "C-c e c q") #'eglot-ations-quickfix)
  (define-key eglot-mode-map (kbd "C-c e c e") #'eglot-ations-extract)
  (define-key eglot-mode-map (kbd "C-c e c i") #'eglot-ations-inline)
  (define-key eglot-mode-map (kbd "C-c e c r") #'eglot-ations-rewrite)

  (add-hook 'ada-mode-hook 'eglot-ensure)
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
               '(ada-mode . ("/home/modolo/opt/GNAT/2021/libexec/gnatstudio/als/ada_language_server"))))

  (add-hook 'ada-mode-hook 'company-mode)

  (with-eval-after-load 'ada-mode

        (setenv "PATH" (concat  "/home/modolo/opt/GNAT/2021/bin:/home/modolo/opt/GNAT/2021/libexec/gnatstudio/als:" (getenv "PATH")))
        (setq exec-path (append '("/home/modolo/opt/GNAT/2021/bin" "/home/modolo/opt/GNAT/2021/libexec/gnatstudio/als" ) exec-path))

        (setq-default indent-tabs-mode nil)

        (define-key xref--transient-buffer-mode-map (kbd "RET") 'xref-goto-xref)
        
        (setq xref-prompt-for-identifier nil) ;; only prompt on C-u
        
        (setq xref-show-xrefs-function #'xref--show-defs-buffer-at-bottom)
        
        (setq xref-show-definitions-function #'xref--show-defs-buffer-at-bottom)
        
        (electric-pair-mode 1)
        
        (require 'imenu) ;; also enables speedbar
        
        (add-to-list 'hippie-expand-try-functions-list 'wisi-skel-hippie-try)
        
        (define-key ada-mode-map "\C-e"     'hippie-expand)
        
        (define-key ada-mode-map [down-mouse-3] 'ada-popup-menu)
        
        (add-hook 'ada-mode-hook
           (lambda ()
            (add-hook 'before-save-hook 'delete-trailing-whitespace nil t)
            (add-hook 'before-save-hook 'copyright-update nil t)
            (add-hook 'before-save-hook
                      (lambda () (untabify (point-min) (point-max)))
                       nil t)))
  )
)
```


(setenv "PATH" (concat (getenv "PATH") ":/home/username/.nvm/versions/node/v10.13.0/bin"))
(setq exec-path (append exec-path '("/home/username/.nvm/versions/node/v10.13.0/bin")))

## C.4.1 General Variables

https://www.gnu.org/software/emacs/manual/html_node/emacs/General-Variables.html

EMACSPATH ¶
A colon-separated list of directories to search for executable files. If set, 
Emacs uses this in addition to PATH (see below) when initializing the 
variable exec-path (see Running Shell Commands from Emacs).
