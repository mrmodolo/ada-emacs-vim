# Criando um Layer para a linguagem Ada

## Exemplo de layet em go
https://github.com/SpaceVim/SpaceVim/blob/master/autoload/SpaceVim/layers/lang/go.vim

## Custom SPC mapping not working

https://github.com/SpaceVim/SpaceVim/issues/2894

Exemplo


```
    call SpaceVim#custom#SPCGroupName(['='], '+Formats')
    call SpaceVim#custom#SPC('nnoremap', ['=', '='], 'gg=G``', 'format-the-buffer', 1)

```

## Configurations neovim nvim-lspconfig

https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

```
als
https://github.com/AdaCore/ada_language_server

Installation instructions can be found here.

Can be configured by passing a "settings" object to als.setup{}:

require('lspconfig').als.setup{
    settings = {
      ada = {
        projectFile = "project.gpr";
        scenarioVariables = { ... };
      }
    }
}
Snippet to enable the language server:

require'lspconfig'.als.setup{}
Default values:

cmd :
{ "ada_language_server" }
filetypes :
{ "ada" }
root_dir :
util.root_pattern("Makefile", ".git", "*.gpr", "*.adc")

```

## Ada Language Server

https://github.com/AdaCore/ada_language_server#Install

```
Integration with Neovim's built-in LSP client
Neovim 0.5.0 and later have a built-in LSP client which can be used with the Ada Language Server. In order to use it with minimal effort, follow these steps:

Install the ada language server and make sure it's in your $PATH.
Use your favorite Neovim plugin manager to add the default set of LSP configuration files to Neovim.
Enable the Ada Language Server by adding :lua require('lspconfig').als.setup{} to your init.vim.
If you would rather not have the ada language server in your path, you can give the lsp client an absolute path to the ALS executable:

require('lspconfig').als.setup{ cmd = "/path/to/als/executable" }
Configuring the language server's settings can be achieved like this:

require('nvim_lsp').als.setup{
  settings = {
    ada = {
      projectFile = "project.gpr";
      scenarioVariables = { ... };
    }
  }
}

```
