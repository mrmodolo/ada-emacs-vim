# Configuração da linguagem ADA nos editores Emacs (Spacemacs) e Vim/VNIM (SPacevim)

```bash
nvim --version
NVIM v0.8.1
Build type: Release
LuaJIT 2.1.0-beta3
Compilado por runner@fv-az178-366

Features: +acl +iconv +tui
See ":help feature-compile"

    arquivo vimrc de sistema: "$VIM/sysinit.vim"
            padrão para $VIM: "/share/nvim"

Run :checkhealth for more info
```

```bash
im --version
VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Sep 13 2022 09:35:02)
Correções incluídas: 1-3995, 4563, 4646, 4774, 4895, 4899, 4901, 4919
Modificado por team+vim@tracker.debian.org
Compilado por team+vim@tracker.debian.org
```

## Configuração do ambiente (PATH para o GNAT)

source ~/.local/bin/gnat-env.sh

## Projeto de teste

/home/modolo/playground/ada-emacs-vim

## Configurações Emacs LSP

```bash
tree .
.
├── default.gpr
├── dir-locals.el
├── obj
│   ├── b__json.adb
│   ├── b__json.ads
│   ├── b__json.ali
│   ├── b__json.o
│   ├── gpr_query.db
│   ├── gpr_query.db-shm
│   ├── gpr_query.db-wal
│   ├── json
│   ├── json.adb.stderr
│   ├── json.adb.stdout
│   ├── json.ali
│   ├── json.bexch
│   └── json.o
├── README.md
└── src
    └── json.adb
```

```lisp

   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(caml cmake ada-mode)

   
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

     (add-hook 'ada-mode-hook 'lsp) 
  )
```

A linha `(add-hook 'ada-mode-hook 'lsp)` foi necessária para carregar automaticamente o LSP [emacs-lsp/lsp-mode](https://gitter.im/emacs-lsp/lsp-mode?at=5d08cdb7e527d95addfd7081)

## Referências

### .dir-locals.el

https://github.com/clojure-emacs/cider/blob/master/.dir-locals.el

### ExecPath EmacsWiki 

https://www.emacswiki.org/emacs/ExecPath

### Ada Mode

https://www.gnu.org/software/emacs/manual/html_node/ada-mode/

### ADA LSP Mode - LSP support for Emacs

> https://emacs-lsp.github.io/lsp-mode/page/lsp-ada/
> 
> Server
> 
> For more information about the LSP server, check ada_language_server.
> 
> Installation
> 
> For more instructions on how to install manually, check here.
> 
> Debugger: Yes (gdb)
> 
> Available configurations
> 
> lsp-ada-alire-executable
> 
> Type: string
> 
> Default: alr
> 
> The alire executable to run when a project is detected.
> 
> lsp-ada-als-executable
> 
> Type: file
> 
> Default: ada_language_server
> 
> Command to start the Ada language server.
> 
> lsp-ada-enable-diagnostics
> 
> Type: boolean
> 
> Default: t
> 
> A boolean to disable diagnostics. Defaults to true.
> 
> lsp-ada-option-charset
> 
> Type: string
> 
> Default: UTF-8
> 
> The charset to use by the Ada Language server. Defaults to UTF-8.
> 
> lsp-ada-project-file
> 
> Type: string
> 
> Default: default.gpr
> 
> Set the project file full path to configure the language server with. 
> The ~ prefix (for the user home directory) is supported. 
> See https://github.com/AdaCore/ada_language_server for a per-project configuration example.

### Ada Language Server

https://github.com/AdaCore/ada_language_server

Integration with emacs lsp-mode
The configuration for each project can be provided using a .dir-locals.el file defined at the root of each project.

The scenario variables should be declared in your .emacs or any loaded Emacs configuration file.

```lisp
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
```
  
Your .dir-locals.el in the project root should be similar to:

```
((ada-mode .
  ((eval . (lsp-register-custom-settings
      '(("ada.scenarioVariables.BINUTILS_SRC_DIR" project-binutils-dir)
        ("ada.scenarioVariables.BUILD_TYPE" project-build-type "Release"))))
   (lsp-ada-project-file . "/home/username/project/project.gpr"))
  ))
```  

The lsp-mode provides built-in support for the ada_language_server and defines 
default customizable configuration values in the lsp-ada group that can be edited 
similarly to lsp-ada-project-file in the example above.

### Download

[ada-mode](https://elpa.gnu.org/packages/ada-mode.html)

[ada-mode 7.3.1](https://elpa.gnu.org/packages/ada-mode-7.3.1.tar)

### Manual Ada Mode

https://elpa.gnu.org/packages/doc/ada-mode.html

```
(setq-default indent-tabs-mode nil)
(define-key xref--transient-buffer-mode-map (kbd "RET") 'xref-goto-xref)
(setq xref-prompt-for-identifier nil) ;; only prompt on C-u
(setq xref-show-xrefs-function #'xref--show-defs-buffer-at-bottom)
(setq xref-show-definitions-function #'xref--show-defs-buffer-at-bottom)

(electric-pair-mode 1)
(require 'imenu) ;; also enables speedbar
(require 'ada-mode)
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

(setenv "PATH" (concat  "/home/modolo/opt/GNAT/2021/bin:/home/modolo/opt/GNAT/2021/libexec/gnatstudio/clang/bin:/home/modolo/opt/GNAT/2021/libexec/gnatstudio/als:/home/modolo/opt/GNAT/2021/libexec/gnatstudio/gnathub/bin:/home/modolo/opt/GNAT/2021/libexec/gnatstudio/gnathub/share/gnathub/python/bin:/home/modolo/opt/GNAT/2021/libexec/spark/bin:/home/modolo/opt/GNAT/2021/share/gdb-10/python-3.8/bin:/home/modolo/opt/GNAT/2021/share/examples/gnat/other_languages/bin:/home/modolo/opt/GNAT/2021/share/examples/gnat/full_project/bin:" (getenv "PATH")))

(setq exec-path (append '("/home/modolo/opt/GNAT/2021/bin" "/home/modolo/opt/GNAT/2021/libexec/gnatstudio/clang/bin" "/home/modolo/opt/GNAT/2021/libexec/gnatstudio/als" "/home/modolo/opt/GNAT/2021/libexec/gnatstudio/gnathub/bin" "/home/modolo/opt/GNAT/2021/libexec/gnatstudio/gnathub/share/gnathub/python/bin" "/home/modolo/opt/GNAT/2021/libexec/spark/bin" "/home/modolo/opt/GNAT/2021/share/gdb-10/python-3.8/bin" "/home/modolo/opt/GNAT/2021/share/examples/gnat/other_languages/bin" "/home/modolo/opt/GNAT/2021/share/examples/gnat/full_project/bin") exec-path))

               
```
[Creating a Spacemacs Layer from an Existing Emacs Package](https://medium.com/@cgrinaldi/creating-a-spacemacs-layer-from-an-existing-emacs-package-efd474bb422d)
