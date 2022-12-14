# ModeHooks

https://www.emacswiki.org/emacs/ModeHooks

Mode hooks make it so you can always set up a mode in a particular way.

For example, if you want to have AutoFillMode on by default in text mode, add this to your DotEmacs file:

 (add-hook 'text-mode-hook 'turn-on-auto-fill)

That ones easy, because there’s a premade function for us, “turn-on-auto-fill.”

But only a very few are like that. For the rest, you can use LambdaFunctions:

 (add-hook 'text-mode-hook (lambda () (set-fill-column 72)))
 (add-hook 'text-mode-hook (lambda () (column-number-mode 1)))

Or just make your own function and assign it:

 (defun setup-text-mode () (set-fill-column 72) (column-number-mode 1))
 (add-hook 'text-mode-hook 'setup-text-mode)

How do you know what to put in place of ‘text-mode-hook’?

I’m not sure what will always work, but the following has worked for me:

Look at the name of the major mode. (Working in bash, it’s “Shell-script.”)

Type C-h v, for variable help.
Start typing the name of the major mode.
Hit “?”, and look for something that ends with “hook.” That’s probably it.
See SaveLog for a simple example of using hooks.

See ManagingHookVariables for more sophisticated ways of adding hooks.

See ChangeHook to use ‘after-change-functions’ and ‘before-change-functions’ for evil hackery (electrifying user input).

Removing Hooks
To remove the hook, it’s like add-hook, mostly:

  (remove-hook 'text-mode-hook 'turn-on-auto-fill)
If the hook function is anonymous (a lambda), then you need to take care that the exact same lambda is used for the removal. If the lambda has been byte-compiled then you need to make sure the same byte-code object is used for the removal. So clearly it generally makes sense to use named functions on hooks.

Clearing Hooks
To clear all hooks for a given hook, set the hook variable to nil:

  (setq focus-out-hook nil)
