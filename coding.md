This document contains notes on how to code on MacOS.

For Style Guides, see style_guide.md

<!--################### Mac ##################-->
# Mac
    - Windows / Programs
        - Open Spotlight (search) menu | Command + Space
        - change programs | Command + Tab
        - change windows within a program | Command + `
        - Open a specific program. Requires "Snap program" | Command + [Number]
        - Enter Mission Control | Three fingers up, or CTRL+up
        - Show all windows for an app | CTRL + Down
        - Show all windows | CTRL + Up
        - Show Dock | OPT + CMD + D  or  CTRL + F3
        - Get proper Alt+Tab behavior | install AltTab https://alt-tab-macos.netlify.app
            - Activate | OPT + Tab
        - Move between spaces | CTRL + Arrow or three finger swipe
        - Snap/Tile | Hold Green button (OPT for more choices), or drag and snap, or 
        - 
    - Typing 
        - move (delete) one word over | Option + Arrow (or delete)
        - move (delete) whole line | Command + Arrow (or delete)
        - Emojis | CMD + CTRL + Space
    - Dyl created:
        - CTRL + SHIFT + L | Copy finder path
    - General
        - Misc shortcuts https://support.apple.com/en-us/102650
        - CTRL + FN + F2 | Open menu bar (like Alt in Windows)
        - Holding Alt bypasses any warning dialog boxes you'd otherwise see. (i.e. for sleep, shut down, etc.)
        - Note: Option = ALT, Command = Windows
        - Force Quit | CMD + OPT + ESC
        - Delete (instead of backspace) | Fn + DEL
        - Explanation of file system https://kyxey.medium.com/the-folder-structure-of-macos-everything-you-need-to-know-d9314ae3bf01
        - Select other iTunes library | OPT + [Click Music]
        - Select in dialog box | spacebar
        - Sleep | CTRL + CMD + Shift + S
            - Manually added https://apple.stackexchange.com/questions/406683/how-to-put-macbook-to-sleep-using-only-an-attached-windows-keyboard
        - New tab | CMD + T
        - Close Window | CMD + W
    - Finder
        - Go to specific folder | SHIFT + CMD + G
        - Show hidden files | CMD + SHIFT + .
        - Command center | Globe + C
        - Open folder | Command + Down
        - Change appearance | CMD + J
    - Terminal
        - Configure terminal | ~/.zprofile
        - Activate venv (generally recommended to always run Python in venv) | souce [venv folder]/bin/activate
            - For Python only. Pip will auto-install only into local environment, not global. Created on top of existing python env ("base")
            - Conventinally name the venv simply "venv"
            - Not checked into source control programs such as git (.gitignore created by default!)
            - Should be simple to recreate it from scratch. Don't place project code in environment
            - Check Python module versions | pip freeze | grep [search term]
            - Reset | reset
        - List installed Homebrew packages | brew list
        - If camera isn't detected, refresh it  | sudo killall VDCAssistant
        - Show all files | ls -a


<!--################### Cross-Platform notes  ##################-->
# Cross-Platform Notes

## Git & GitHub
    - General and Configuring
        -key Git commands https://confluence.atlassian.com/bitbucketserver/basic-git-commands-776639767.html
        -Store git password in cache <  https://help.github.com/articles/caching-your-github-password-in-git/ >:
            git config --global credential.helper cache
            git config --global credential.helper 'cache --timeout=3600'
            - Update git password | git config --global --unset user.password
        - Notes from < https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell >
            git stores series of snapshots
            git stores a commit object that points to the snapshot (also name and comment, and pointers to parents)
            staging (git add .) stores a version of a file as a "blob"
            commit takes trees of these blobs and makes a commit object pointing at the root of the tree
                git config --global core.autocrlf true | change cr to lf (Unix). Windows does cr lf. Old mac does cr. (see also https://stackoverflow.com/questions/1552749/difference-between-cr-lf-lf-and-cr-line-break-types)
        - git config --global core.whitespace cr-at-eol | tell git that cr is not a change. (https://stackoverflow.com/questions/1889559/git-diff-to-ignore-m)
        - Permission denied (publickey) error. This means your public key on GitHub doesn't match the one you have in /home/[username]/.ssh/id_rsa.pub   so copy that key to the GitHub settings page, or generate a new one and upload that new one...  | https://gist.github.com/adamjohnson/5682757

    - Clone | git clone [HTTPS]
    - add all changes | ** git add .
    - make a commit | ** git commit -m "a comment"
    - Remotes
        ** git push | send changes
            git push --all | send changes for all branches
            git push origin [branch] | Push the changes to local branch to GitHub.
            git push origin localBranch:remoteBranch | push the contents of localBranch, aliased as remoteBranch. remoteBranch doesn't have to exist on the remote yet
            git push origin --delete [branch] | delete a remote branch
            - After attempting a failed "git merge" or "git push", edit the file, and do 'git add filename' to mark it as resolved. Then push/merge again
        - Set the new remote | git remote add origin remote repository_URL
        - Verify the new remote URL | git remote -v
        - delete local knowledge of an origin branch if it was truly deleted on the origin | git remote prune origin

        ** git pull | get changes from remote
            git pull --all | get changes from remote, for all branches

        IMPORTANT: "git fetch" will not modify your working directory. It will simply get the data and let you merge it yourself. "git pull" is a git fetch immediately followed by a git merge in most cases. < https://git-scm.com/book/en/v2/Git-Branching-Remote-Branches >
    - Commits and files
        git diff --cached | Show cached (staged) changes
        git reset HEAD^ | Delete most recent commit
        git log --graph --oneline --all | Show commit tree
        git log --pretty=format:"%h%x09%an%x09%ad%x09%s" | Show comit log with commit, author, date/time, comment. https://git-scm.com/docs/pretty-formats
        git log --pretty=format:"%h%x09%ar%x09%s" | Show comit log with commit, relative date/time, comment. https://git-scm.com/docs/pretty-formats
        git ls-tree -r master --name-only | List all tracked files in master branch. Note: will list files from previous commit. If you're adding a .gitignore, you need to commit to see current list
        git rm -r --cached . | Untrack all tracked files. Use when adding a .gitignore
        git add -A && git commit -a -m "addTest" | add all files to the "tracked" list, and commit all changes to tracked files
            if you don't add a file to "tracked", then you will not delete it when "checkout" another branch, or committing/pulling/pushing

    - Branches
        - Diff from current branch and remote branch, ignoring whitespace | git diff [localBranch] [origin/remoteBranch] -w
        - Make a branch (-a shows local and remote branches, -r remote branches) | git branch
        - Delete a remote branch | git push -d <remote_name> <branch_name>
        - Delete a branch | git branch -d <branch_name>
        - ** Change pwd to the specified branch | git checkout [branch_name]
        - ** Make a new local branch which tracks a remote branch | git branch --track [branch] origin/[branch]
        - Rebasing
            - You can take the patch of the change that was introduced in C4 and reapply it on top of C3. In Git, this is called rebasing. With the rebase command, you can take all the changes that were committed on one branch and replay them on another one.
            - Rebasing basically returns a branch to the main line as a linear commit
        - Renaming branches
            1. Rename your local branch.
                If you are on the branch you want to rename:
                    git branch -m new-name
                If you are on a different branch:
                    git branch -m old-name new-name
            2. Delete the old-name remote branch and push the new-name local branch.
                git push origin :old-name new-name
            3. Reset the upstream branch for the new-name local branch. Switch to the branch and then: 
                git push origin -u new-name

## HTML
    - browser-sync start --server --files . 
    - HTML elements with no content are called empty elements.
    - HTML tags are not case sensitive, but use lowercase anyway. <P> means the same as <p>
    - Attributes
        alt | Specifies an alternative text for an image, when the image cannot be displayed
        href | Specifies the URL (web address) for a link
        id | Specifies a unique id for an element
        src | Specifies the URL (web address) for an image
        style | Specifies an inline CSS style for an element
        title | Specifies extra information about an element (displayed as a tool tip)
    - HTML Tags
        - <p> paragraph
        - <br> line break.
        - links <a href="[url]">Text</a>
        - images <img src="[source]" alt="[text]" width="104" height="142">
        - Button <button>Click me</button>
        - list
            <ul>
              <li>Coffee</li>
              <li>Tea</li>
              <li>Milk</li>
            </ul>
        - <html>  Defines the root of an HTML document
        - <body>  Defines the document's body
        - <head>  A container for all the head elements (title, scripts, styles, meta information, and more)
        - <h1> to <h6>    Defines HTML headings
    - Specificity:
        Inline styling (right next to the element like li style="color:red"), ID (#'s), Class (class=someClass, in the CSS as .someClass), Element (generic classes)
        If the element has inline styling, that automatically1 wins (1,0,0,0 points)
        For each ID value, apply 0,1,0,0 points
        For each class value (or pseudo-class or attribute selector), apply 0,0,1,0 points
        For each element reference, apply 0,0,0,1 point

## Python
    - Tutorial | https://docs.python.org/3/tutorial/index.html
    - help('modules') | list installed python modules
    - automatically load packages
        - install: sudo pip install autoimp
        - Upgrade python -m pip install --upgrade [package]
        - use in script or CLI: from autoimp import *
    - python -m pip install [your package] | use pip to install a package
    - python -m pip -U upgrade [your package] | use pip to upgrade a package
    - python -m pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U        | Update all packages
    - Pip packages are 
    - To update Anaconda, open Anaconda Prompt, and enter 
        conda update conda
        conda update anaconda=VersionNumber

    - install module "pyserial" instead of "serial". Both use "import serial"
    - Python module variables https://stackoverflow.com/questions/1977362/how-to-create-module-wide-variables-in-python
        - A python file is technically a module, and can be imported with its module-level namespace using 'import file.py') 
        - Check for variable using "if _NAME_ is None"
        - Make module's variable psuedo-private using __variable
        - But the most convenient is a class instance, and you can just use a trivial class:
            class Box:
                pass

            __m = Box()  # m will contain all module-level values
            __m.dbname = None  # database name global in module

            # later, in code:
            if __m.dbname is None:
                __m.dbname = name
    - Method vs. function vs. procedure. "The terms "procedure, function, subroutine, subprogram, and method" all really mean the same thing". Typically "method" only refers to functions associated with an object.
    - ''Mutable'' objects can be changed
    - Functions https://realpython.com/primer-on-python-decorators/
        - Functions can be passed as reference to functions. 
            def say_hello(name):
                return f"Hello {name}"

            def be_awesome(name):
                return f"Yo {name}, together we are the awesomest!"

            def greet_bob(greeter_func):
                return greeter_func("Bob")

            ... later
            >>> greet_bob(be_awesome)
            'Yo Bob, together we are the awesomest!'
        - Decorators wrap functions
            def my_decorator(func):
                def wrapper():
                    print("Something is happening before the function is called.")
                    func()
                    print("Something is happening after the function is called.")
                return wrapper

            @my_decorator
            def say_whee():
                print("Whee!")
            So, @my_decorator is just an easier way of saying say_whee = my_decorator(say_whee). It’s how you apply a decorator to a function
    - Clean code with pylint3 (or pylint for Python 2)
    - Code profiling with py-spy
        - https://github.com/benfred/py-spy
        - py-spy record -o profile.svg -- python myprogram.py
        - Open the interactive SVG with a browser such as Chrome


## Sublime
    - Show menu bar Alt + V --> Show Menu
    - replace text | Ctrl + H, then CTRL + ALT + ENTER
    - packages:
        - Packages are zip files, so you can open "C:\Users\chill\AppData\Roaming\Sublime Text 3\Installed Packages", copy the package to new location, extract there, and view the source files.
        LaTeXTools | compile LaTeX
        MarkdownLivePreview | view .md files with fancy colors
        Matlab Completions | allow tab-completion of matlab functions
        Monokai Extended | view files with Monokai color scheme
        Package Control | easily install packages
        SFTP | save remotely over SSH etc.
        BufferScroll | Remember code folding after closing and re-opening sublime | https://github.com/titoBouzout/BufferScroll
    - Customize settings. "Packages/User/Preferences.sublime-settings", or Preferences -> Settings. https://www.sublimetext.com/docs/3/settings.html
        - Or at C:\Users\chill\AppData\Roaming\Sublime Text 3\Packages
        - Prevent from opening in new Window | "open_files_in_new_window": "never",
        - Get reasonable CTRL + Tab behavior by adding to "Preferences/Key Bindings"
            { "keys": ["ctrl+tab"], "command": "next_view" },
            { "keys": ["ctrl+shift+tab"], "command": "prev_view" }
    - Keyboard shortcuts
        - CTRL + K, CTRL + L | lower case
        - CTRL + K, CTRL + U | upper case (capitalized)
        - CTRL + SHIFT + V | Paste and auto-format
        - CTRL + P | go to files
        - CTRL + J | Join
        - CTRL + D + enters | Select multiple instances of a word
        - CTRL + K, CTRL + 1 | collapse to level 1
        - Alt + F3 | Select all instances of a word
        - Alt + CTRL + Arrows | Multiple selection
        - F9 alphabetical sort
        - CTRL + Shift + P -> Reindent lines | reindent lines
            - Dyl custom keymap as Alt+Shift+R
        - Surround in HTML Tag | Alt-Shift-W
        - Clean auxilliary LaTeX files | CTRL + L, backspace
    - Regex search and replacement
        - ^\n | Find blank lines
        - \d | Find numbers
        - Cleaning LaTeX .bib files:
            -   \tkeywords\s.*\n | find keywords (in bib)
            -   \tabstract\s.*\n | find abstracts (in bib)
                "    abstract\s.*\n" (select within the quotes) | find abstracts (in bib)
            -   \tfile\s.*\n | find keywords (in bib)
            -   ,\n} | clean up final entries --> replace with \n}
            - Also searh for (removing the tabs) 
            ,
            }
            and replace with

            }





<!--################### Ubuntu / Linux  ##################-->
# Bonus: Ubuntu / Linux

## Terminal

### Save on typing
    - Ctrl + R | Searches previous commands. Then, press Enter.
    - history | Command history. !x to execute a command. history | less for a scrollable list.
    - Up Arrow | Scrolls through command history
    - tab | autocomplete

### Files and folders
    - edit default folders in nautilus 
        - https://askubuntu.com/questions/79150/how-to-remove-bookmarks-from-the-nautilus-sidebar
        - https://askubuntu.com/questions/762591/how-to-remove-unwanted-default-bookmarks-in-nautilus
    - create empty file | touch file.txt
    - change directory, list contents (-l is long format), present working directory, copy | cd, ls, pwd, cp
    - only show files of a given filetype | ls *.mp3
    - remove (delete). -r recursive | rm
    - remove empty directory | rmdir
    - symbolic links
        - ln -sf /path/to/file /path/to/symlink
        - do "ln -s" if you want it to fail if the symlink already exists.
        - example:    sudo ln -s ~/Zotero_linux-x86_64/zotero.desktop ~/.local/share/applications/
    - Get permission to read/write to usb ports https://askubuntu.com/questions/210177/serial-port-terminal-cannot-open-dev-ttys0-permission-denied

### Misc Terminal
    -CTRL + ALT + T = open terminal
    - run command non-blocking | [command] &
    - display running processes | top
    - exit terminal | exit or CTRL + D
    - run a child terminal | bash
    - list installed programs | apt list --installed
    - Uninstal program | sudo apt remove package-name
    - go to previous listed directory | cd $(!!)
        - !! previous command. $(~) string of ~'s output
    - open file with default program | xdg-open
    - Enable hibernation | sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
    - Grep
        - cat otherfile | grep 'something'
        - command option1 | grep 'data'
        - grep --color 'data' fileName
    - ** Terminal multiplexer | tmux
        - if TMUX is stalled, unstall it | ctrl-q 
        - tmux can be controlled using a prefix key (Ctrl-b) and a command key.
            % | Split into two panes
            " | Split our second pane horizontally
            o | switch to the next pane (panes are numbered left-to-right, top-down)
            c | create a new window
            n | move to the next window
            p | move backwards in the index
            d | Detach from a session
        - A step in context above panes are windows. Windows behave similarly to tabs in a browser.
        - When tmux starts up, it gives you a window and a single pane inside the window.
        - When you exit the last shell in the last pane in the last window of a session, the session will terminate. Instead of exiting from the session entirely, you can _detach_ from the session.
        - A session will continue to run in the background (tmux will fork into the background), running whatever shells were on it when you detached.
        - When you re-attach to the session later, you will return to the session in the same state it was when you detached. All windows and panes are retained by the session.

        - Re-attach to a session | tmux attach -t [session name]
        - view active sessions, numbered beginning from 0 | tmux list-sessions
        - join current pane to window 0 |  tmux join-pane -s :0
        - break current pane to a new window | tmux break-pane
        - VIM
            - vim filename | create a file with vim
            - CTRL + S will freeze screen. Do CTRL + Q to unfreeze
            :set mouse=a" to enable the mouse (in xterm or GUI)
             < https://coderwall.com/p/adv71w/basic-vim-commands-for-getting-started >
            - Vim has two modes
                - 1. Insert mode = normal text editor. Press i
                - 2. Command mode = give commands to the editor. Press ESC

                - Most below are in command mode
                    x - to delete the unwanted character
                    u - to undo the last the command and U to undo the whole line
                    CTRL-R to redo
                    A - to append text at the end
                    :wq - to save and exit
                    :q! - to trash all changes
                    dw - move the cursor to the beginning of the word to delete that word
                    2w - to move the cursor two words forward.
                    3e - to move the cursor to the end of the third word forward.
                    0 (zero) to move to the start of the line.
                    d2w - which deletes 2 words .. number can be changed for deleting the number of consecutive words like d3w
                    dd to delete the line and 2dd to delete to line .number can be changed for deleting the number of consecutive words

                - The format for a change command is: operator [number] motion
                    - operator - what to do, such as d for delete
                    - [number] - optional count to repeat the motion
                    - motion - moves over the text to operate on, such as w (word), $ (to the end of line), etc.

                    p - put the previously deleted text after the cursor (Type dd to delete the line and store it in a Vim register. and p to put the line)
                    r - replace the letter e.g press re to replace the letter with e
                    ce - change until the end of a word (place the cursor on the u in lubw it will delete ubw )
                    ce - deletes the word and places you in Insert mode
                    G - move to the bottom of the file.
                    gg - move to the start of the file.
                    Type the number of the line you were on and then G
                    % to find a matching ),], or }
                    :s/old/new/g - substitute 'new' for 'old' where g is backward search. n to find the next occurrence and N to search in opposite direction
                    ? forward search
                    :! - run the shell commands like :!dir, :!ls
                    :w - TEST (where TEST is the filename you chose.) . Save the file
                    v - visual mode for selecting the lines and you can perform operation on that like d delete
                    R - replace more than one character
                    y - operator to copy text using v visual mode and p to paste it
                    yw - (copy)yanks one word
                    o - opens a line below the cursor and start Insert mode.
                    O - opens a line above the cursor.
                    a - inserts text after the cursor.
                    A - inserts text after the end of the line.
                    e - command moves to the end of a word.
                    y - operator yanks (copies) text, p puts (pastes) it.
                    R - enters Replace mode until <ESC> is pressed.
                    ctrl-w to jump from one window to another
                - Brian Coltin's favorite commands
                    dd | delete line
                    dw | delete word
                    i | insert
                    I | insert @ beginning
                    a | append
                    A | append @ end
                    r | replace
                    R | replace and continue
                    %s/mat/find/replace
                    v | visual select. Workflow: v [select text] [command, such as i] [type your text] ESC
                    CTRL + V | block visual
                    :! Bash commandsI
                    :split | split horizontal
                    :vsplit | split vertical
                    / | search, n next
