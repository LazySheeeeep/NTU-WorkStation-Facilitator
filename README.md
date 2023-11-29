# NTU WorkStation Facilitator
This repo is going to help you smoothly shifting your `$HOME` **temporarily** to `/tmp2/yourID` **during your using** for unlimited disk usage; also help you create conda env in each ws.

## `$HOME` Shifting
Why you need `$HOME` Shifting?

*If you have unlimited `$HOME` space, you can ignore is repo:)*

Obviously, if you don't shift your `$HOME`, you have to specify the path of everything you download (e.g., conda env, models, etc) to `/tmp2`, and sometimes your program you download would automatically produce some folders or cache files under your `$HOME` directory, which is really a pain in the ass to handle with, due to the limited 500MB space per `$HOME`.


- $HOME Shifting code implemented in `.profile`, which will be sourced by `/bin/bash` every time you login.
- During your $HOME shifting, the `.profile` will be copy to your new home `/tmp2/yourID`, while your old home dir name saved to `$ORIGIN`.
- When `.profile` is executing, it would automatically source `.shrc`.
- Set an alias `back` to `cd` back to old home `$ORIGIN`.
- Included and upgrade the hushlogin detection. You can mute all the unecessary output everytime you login.

## Easier Conda Environment Building

- In `.shrc`, which would be executed every time you login, it would automatically init conda, help you activate base (whenever you set your conda in new `$HOME` or not)
    - If no conda is downloaded, it would automatically download miniconda.sh to `$ORIGIN/Downloads`, then copy to new `$HOME`, with specific command offered for you to execute manually. 
- Every env created by this conda would completely separate from old home `$ORIGIN`, meaning, no space in old home `$ORIGIN` would be hogged by any thing from python packages. Even if you run python files under `$ORIGIN`.
- Conda env list would be showed up every time you login, helping you to know about current ws as soon as you login.

## For Better TMUX Experience
Every time you use `tmux`, it would automatically source `$HOME/.profile` (if you don't have any tmux dotfile/config files). And it was already copied when you login.

## Customization
- You can easily customize your personal settings in `.shrc` and `.profile` in lieu of mine.