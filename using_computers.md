This document contains notes on how to use Windows, as well as some cross-platform programs. Don't code on Windows.


<!--################### Windows ##################-->
# Windows

## Command Prompt
    - Copy just the folder structure, not the files: xcopy C:\Folders D:\Folders /t /e
    - From https://superuser.com/questions/530128/how-to-copy-a-directory-structure-without-copying-files
    - Change file extensions | rename *.shn *.wav
    - List current folder's files | pwd

## General Notes:
    - Add or remove filetypes from "New" right-click context menu
    - Add program to start C:\Users\dshah\AppData\Roaming\Microsoft\Windows\Start Menu\Programs
    - disable function keys | Win + Esc
    - I disabled F1 help using regedit
        - https://answers.microsoft.com/en-us/windows/forum/all/how-to-disable-or-remove-hotkey-f1-for-help-and/3533c72a-9378-4a06-9711-ae8c2d1bfe4f
        - Open regedit. CTRL+F "helppane.exe" and make sure only Data is selected and nothing else.  This should lead you to the keys that point towards the executable which you can then rename or remove at your own risk.  Was C:\Windows\helppane.exe
    - To save a PDF without a dialog box popping up, turn off protected mode
        https://support.smartvault.com/Other/Knowledge_Base_and_Known_Issues/Get_%22Save_As%22_prompt_when_saving_a_pdf
    - I permanently enabled "show additional options" in file explorer
        https://allthings.how/how-to-show-more-options-by-default-in-windows-11-file-explorer/
    - I added "faboratoryResearch", "Personal", and X Drive to this list of Word/Office trusted locations. (I checked "Allow Trusted Locations on my network (not recommended)")
    - Win + R -> sysdm.cpl -> advanced -> settings | Edit windows animations
    - Change startup items | (WIN+R) shell:startup
    - git configured with ssh key for github.com with no password. Just SSH keys. https://help.github.com/articles/working-with-ssh-key-passphrases/    
        - update the remote for your repositories to use the ssh rather than normal push.    https://gist.github.com/developius/c81f021eb5c5916013dc
    - Powershell
        - Make variable named "nr" | $nr
        - Renaming multiple files in PowerShell, within a single folder
            Dir | %{Rename-Item $_ -NewName ("pancakebot_feet_100_mm_min_{0}.csv" -f $nr++)}
            Get-ChildItem -Filter “*current*” -Recurse | Rename-Item -NewName {$_.name -replace ‘current’,’old’ }
            - Change extension from .log to .csv | Dir -Recurse *.log | rename-item -newname { [io.path]::ChangeExtension($_.name, "csv") }
            - Change to lowercase  | dir -r | % { if ($_.Name -cne $_.Name.ToLower()) { ren $_.FullName $_.Name.ToLower() } }
    - For Python, use Anaconda. I copied python.exe and renamed it python3.exe in C:\ProgramData\Anaconda3
    - Disable Cortana web searches by adding two or three DWORDS to registry 
        - https://www.techbout.com/disable-web-results-in-windows-search-44034/
        - https://winaero.com/how-to-disable-web-links-in-search-in-windows-11/
    - Task Manager --> Performance --> Memory
        - In use: used at this moment, matches the top graph
        - Committed: Commit charge / Commit limit.    How much is in the page file vs. how much can be in the page file
        - Cached: memory being passively used by the OS - stored for easy use if/when needed
        - Paged pool - memory used by OS processes (kernel mode components) that can be moved to page file if resources run out
        - Non-paged pool: memory used by kernel-mode components that must be kept in physical memory
    
## Keyboard Shortcuts
    - Use AutoHotkey to make custom shortcuts
				F9(search) -> Home
				Insert -> End
    - Move left a desktop = Windows + CTRL + Left
    - task view = Windows + tab
    - Cycle between windows = alt + tab
    - Hibernate = Win + x, u, h
    - Windows  + E | Open File Explorer
    - Windows  + R | Open the Run dialog box
    - Windows  + Shift + number | Open the desktop and start a new instance of the app pinned to the taskbar in the position indicated by the number
    - Windows  + Home | Minimize all excetp the active desktop window (restores all windows on second stroke)
    - Ctrl + Shift + Esc  Open Task Manager
    - Ctrl + F4   Close the active document (in apps that are full-screen and let you have multiple documents open at the same time)
    - Symbols - use numpad
        - α | ALT + 224 alpha
        - ß | ALT + 225 beta
        - δ | ALT + 235 delta
        - Δ | ALT + 916 Delta (Capital) - doesn't work in Sublime
        - ε | ALT + 238 epsilon
        - π | ALT + 227 pi
        - µ | ALT + 230 mu
        - Σ | ALT + 228 sigma
        - σ | ALT + 229 sigma
        - τ | ALT + 231 tau
        - Ω | ALT + 234 omega
        - Φ | ALT + 232 (phi)
        - Θ | ALT + 233 (Theta)
        - θ | ALT + 952 - doesn't always work
        - λ | ALT + 955 (lamda)

        - ° | ALT + 0176 (degree)
        - ø | ALT + 0248 (diameter)


<!--################### Cross-Platform notes  ##################-->
# Cross-Platform notes

## Acrobat
    - S | Sticky note (comment)
    - CTRL + E | Text edits
    - CTRL + U | highlight 
    - Shift + U | cycle through highlighting tools
    - X | text box
    - Enter | Open pop-up note for current item
    - R | Reply to comment
    - Esc | Exit popup
    - CTRL + E | Open "edit" dialog
    - F8 collapse tool
    - F9 collapse menu
    - Fixing number out of range error
        - https://helpx.adobe.com/acrobat/kb/a-number-is-out-of-range-error-viewing-pdf-deleting-pages.html
        - File > Export To > PostScript.
        - [Give it a name]
        - Right-click the file and choose "Open with Adobe Acrobat Distiller."
        - Should auto-output the file & you're done

## Camtasia
    - Add last used transition | Shift + T
    - Export to local file | Ctrl + E
    - Group | Ctrl + G
    - Ungroup | CTRL + U
    - Split | S
    - Duplicate | CTRL + D
    - Step Forward | ,
    - Step backward | .
    - Jump to beginning of timeline | CTRL + Home
    - Jump to end of timeline | CTRL + End

## Changing hard drives with a "Windows + Ubuntu" partition structure
    - from http://eggsonbread.com/2010/01/28/move-ubuntu-to-another-computer-in-3-simple-steps/index.html
        - Step 1: Store the list of installed packages
            sudo dpkg --get-selections | sed "s/.*deinstall//" | sed "s/install$//g" > ~/pkglist   asteriskForSyntaxHighlighting*
        - Step 2: Transfer your config and documents
        - Step 3: Install packages
        - On the target machine run the following command in a failsafe terminal session to install your packages:
        sudo aptitude update && cat pkglist | xargs sudo aptitude install -y
        - I keep a pkglist in this repository. Remove things related to MATLAB and grub. The Grub files will generate errors when run with the above command, best to install grub and grub-2 separately
        - You will need to add the PPAs (repository locations) for chrome, sublime, zotero, and tuxboot
        - Install eagle separately
        - Copy the .bash_profile and .bashrc to ~/
        - Copy the dylStartupBash.sh to /etc/profile.d/
        - Add your windows partition by editing /etc/fstab or the "Disks" tool
        - If the ubuntu is encrypted, it will be difficult to clone to the new hard drive. So I do a clean install of ubuntu every time I switch computers

## Corel 
    - CTRL | Move vertically or horizontally
    - Click + Drag + Spacebar | copy in new location
    - Windows -> Dockers to open the "filet" and "join curves" dialogues
    - Dylan's custom commands
        - Alt + B | Back minus front
        - Alt + d | distance
        - Alt + e | ellipse
        - Alt + f | front minus back
        - Alt + I | Intersect
        - Alt + l | 2-point line
        - Alt + s | select ("pick tool")
        - Alt + T | trim
        - Alt + W | Weld
    - Align
        - b | bottom
        - c | center
        - e | vertical
        - l | left
        - r | right
        - t | top 
    Distribute
        - Shift + e | Centers horizontally
        - shift + c | centers vertically
        - 
    - CTRL + G | group
    - CTRL + U | ungroup
    - Order
        - CTRL + PgDn | move back
        - CTRL + PgUp | move front
        - SHIFT + PgDn | to back of layer
        - SHIFT + PgUp | to front of layer
        - CTRL + End | to back of page
        - CTRL + Home | to front of page
    - Objects -> Objects | Object Manager

## Google Docs
    - Superscript | CTRL + .
    - Subscript | CTRL + ,
    - Clear text formatting | CTRL + \

## ImageJ
    - import as File -> Import -> Image Sequence
    - Draw line
    - Analyze -> Set Scale
    - Draw line
    - CTRL + M | measure (distance is on far right)

## Inkscape
    - See https://inkscape.org/doc/keys.html
    - F1, s | selector
    - F2, n | Node
    - F4, r | rectangle
    - F5, e | ellipse
    - F6, [] | pencil
    - F7,   | eyedropper
    - F8, t | text
    - CTRL + SHIFT + V | Paste text format
    - % | Toggle Snapping
    - Dialogs = SHIFT + CTRL +
        - f | fill * Stroke
        - t | text & Font
        - m | transform
        - l | layers
        - a | align and distribute
        - o | object properties
        - e | export to PNG
    - Canvas
        - =, + | Zoom in
        - - | zoom out
        - SHIFT + Middle click | zoom into area
        - 3 zoom to selection
        - Shift + R | Reset rotation to zero
    - Palette
        - Click | set fill
        - SHIFT + Click | set stroke
        - Mouse drag | drag fill color
        - SHIFT + drag | drag stroke
    - *SHIFT + CTRL + E | export to PNG*
    - Layers
        - SHIFT + CTRL + N | new layer
        - SHIFT + PgUp | move up
        - SHIFT + PgDn | move down
        - SHIFT + CTRL + PgUp | raise
        - SHIFT + CTRL + PgDn | lower
        - SHIFT + CTRL + Home | raise to top
        - SHIFT + CTRL + End | lower to bottom
    - Alt + D | clone
    - Alt + I | Pattern
    - CTRL + G | Group
    - CTRL + U | Ungroup
    - *Align*
        - Ctrl + Alt + H --> Shift + E | center on vertical axis
        - Ctrl + Alt + T --> Shift + C | center on horizontal axis
        - Ctrl + Alt + keypad 5 | center on horizontal and vertical axis
        - Ctrl + Alt + keypad 4 | align left edges
        - Ctrl + Alt + keypad 8 | align top edges
        - Ctrl + Alt + keypad 6 | align right edges
        - Ctrl + Alt + keypad 2 | align bottom edges
        Dylan Shortcuts
            - Ctrl + Alt + Right | align left edge with right edge of anchor
            - Ctrl + Alt + Left | Align right edge with left edge of anchor
            - Ctrl + Alt + Up | Align botton edge with top edge of anchor
            - Ctrl + Alt + Down | Align top edge with bottom edge of anchor
    - Order / Layer
        - Home | raise selection to top
        - End | lower selection to bottom
        - PgUp | raise selection one step
        - PgDn | lower selection one step
    - Selector
        - Tab | next object
        - CTRL + Click | select within group
        - Alt + Click | Select under
        - 
    - Path
        - SHIFT + CTRL + C | Convert to path -- useful for welding a thin curve to an object and having a shared border, rather than having it fill in the concave sections of the path
        - CTRL + + | Union
        - CTRL + - | Union
        - SHIFT + J | Join 
        - CTRL + SHIFT + K | Break apart
    - Node
        - Shift + S | Make smooth
    - Objects -> Objects | Object Manager
        - Shift + X | Set Clip
    - Add 3D perspective
        - Group your parts
        - Path -> Object to Path
        - Draw quadrilateral (must be exactly 4 points on a single path)
        - Select your parts
        - Shift+click your quadrilateral
        - Extensions -> Modify Path -> Perspective
        - Will take ~30 seconds to a minute to compute
        - 
    - Trace 
    - Paste
        - CTRL + SHIFT + B | Width
        - CTRL + SHIFT + V | Formatting

## Itunes
    1. Keep for completeness
    2. Listen to rarely (every year)
    3. Listen to occasionally (every several months)
    4. Great (every few months)
    5. A classic, awesome song

## Handbrake
    - No border, no audio, no title cards, not captions, constant framerate

## LaTeX
    - Sample images | \noindent\includegraphics[width=3cm]{example-image-a}\qquad
    - Compiled using MiKTeX
    - BibTeX:
        - Takes as input
            an .aux file produced by LaTeX on an earlier run;
            a .bst file (the style file), which specifies the general reference-list style and specifies how to format individual entries, and which is written by a style designer [..] in a special-purpose language [..], and
            .bib file(s) constituting a database of all reference-list entries the user might ever hope to use.
        - BibTeX chooses from the .bib file(s) only those entries specified by the .aux file (that is, those given by LaTeX's \cite or \nocite commands), and creates as output a .bbl file containing these entries together with the formatting commands specified by the .bst file [..]. LaTeX will use the .bbl file, perhaps edited by the user, to produce the reference list.
        - When compiling through Sublime, using " or capital letters breaks entire citation/reference process
    - Overleaf: get .bbl to paste into .tex (for journals) using "Other logs & files" -> bbl file

## Mathematica
	- Module makes variable local
	- D[f,{x,n}] gives the multiple derivative dnf/dxn
	- greek letters with "\[Theta]"
	- := is almost always best for defining functions, whereas = is almost always best when assigning values to variables in commands like z = 3.
	- CTRL + . | Select a larger section
	- Shift + Enter | Run current section
	- no underscores in names
	- Indefinite integrals assume no constant of integration. You can explicitly show it how to add constant of integration using boundary conditions | https://reference.wolfram.com/language/tutorial/IndefiniteIntegrals.html
	- (*Color information*)
	ColorData[97, "ColorList"]
	Cell[StyleData[All,"Printout"],ShowSyntaxStyles\[Rule]True]
	via https://mathematica.stackexchange.com/questions/15444/how-to-\
	export-notebook-in-colored-pdf-form

## MATLAB
    - Plotting options
        Line Style:  - solid, -- dashed, : dotted; -. dash-dot
        Markers:  + plus, o circle, * asterisk, . point, x cross, s square, d diamond, ^v<> pointing triangles, p 5-pointed star (pentagram), h 6-pointed star (hexagram)
        Colors:  r red, y yellow, g green, c cyan, b blue, m magenta (pink), k black, w white
    - Visuals - use schemer_import, Monokai, then use MATLAB Preferences to switch Colors --> background to dark black
        - https://www.mathworks.com/matlabcentral/fileexchange/53862-matlab-schemer

## Photoshop
    - Custom Keyboard Shortcuts
        - CTRL + L (conflict with Adjustments --> Levels) | Load into Stack
        - CTRL + B (conflict with Image > Adjustments > Color Balance)| Blend
        - CTRL + ALT + X | Export as PNG

## MS Office
    - PowerPoint
        - Increase font size | Ctrl + Shift + >
        - Decrease font size | Ctrl + Shift + <
        - Display the font dialog box | Ctrl + T or Ctrl + Shift + F
            - 
        - Subscript | Ctrl + Shift + Plus sign
        - Superscript | Ctrl + Shift + Equals sign
        - Group | Ctrl + G
        - Ungroup | Ctrl + Shift + G
        - ** Slide number + Enter | During presentation, go to slide number
        - Copy formatting of selected shape | Ctrl + Shift + C
        - Paste formatting only to another shape | Ctrl + Shift + V
        - Insert hyperlink | Ctrl + K
        - ** Move to different tabs on the ribbon. Alt +
            - File | F
            - Home | H
            - Insert | N
            - Design | G
            - Transitions | K
            - Animations | A
            - ** Picture Tools | JP
                - ** Align | AA
        - Repeat | F4
        - Run presentation | F5
        - Make screen black | B
        - Make screen white | W
        - 
    - Excel
        - Show formulas | CTRL + `

## Programs
    Program : Use : user-added shortcut keys

    - Adobe Acrobat Reader : PDF viewing
    - Arduino : Arduino compiling (edit Arduino in Notepad++). Libraries in 
    - Audacity : Audio editing
    - Camtasia : Video editing - Export as Custom, MP4, 1080 x 720, no controller etc.
    - Code Compare: Code comparing
    - Command Prompt : running *Python* for real-time robotics applications (compatible with ROS on Linux), *Git* for code version control
    - CorelDraw : edit/create layouts for LaserCutter
    - EAGLE : PCBs
    - GIMP : Image editing
    - Inkscape : Vector graphics editing
    - GitHub : Coding version control
    - *MATLAB* : Plotting, general calculations, data processing : Ctru + U = Uppercase
    - *Mathematica* : solving analytic equations
    - *MPLAB* : PIC microcontroller programming (Assembly or C language) : Ctrl + D = make and download to device
    - Office : Worksheets (should be Yale address). Add apostrophe to Excel entry to force a number to be displayed as text, as '1000000  vs. 1E6
    - (Octave : Free MATLAB editor)
    - *Overleaf* : LaTex Papers/Posters online
    - PyCharm : Python coding (also requires Python)
    - *RStudio* : high-powered statistical data processing
    - Resize Image : resize images
    - Skype : Video Chatting
    - Sublime : Text editing, local *LaTeX* editing and compiling
    - TreeSize : mapping file and folder sizes
    - (WinHTTrack Website Copier : Download complete local copy of website)
    - *Win32DiskImager* : Making Linux ISO's (installation images)
    - Zotero : Academic reference manager
    - Zoom : Video chatting

## OneNote
    - https://support.microsoft.com/en-us/office/keyboard-shortcuts-in-onenote-44b8b3f4-c274-4bcc-a089-e80fdcc87950
    - New Equation | Alt + =
    - Spellcheck | F7
    - Highlight | CTRL + ALT + H
    - Hyperlink | CTRL + K
    - Copy formatting | CTRL + SHIFT + C
    - Paste formatting | CTRL + SHIFT + V
    - Superscript | CTRL + SHIFT + =
    - Subscript | CTRL + =
    - Bullet | CTRL + .
    - Numbered list | CTRL + /
    - Heading 1 | CTRL + ALT + 1
    - Clear formatting | CTRL + SHIFT + N
    - Change indenting | ALT + SHIFT + [Arrow]
    - Create table | type, then TAB
    - 

## Slack
    - CTRL + Shift + U hyperlink
    - 

## VLC
    - open multiple windows
        - In the Interface tab, scroll down to playlist and instances
        - Untick checkboxes for "Allow only one instance" and "use only one instance when started from file manager"
        - Press Save.
    - advance one frame | e
    - screenshot | shift + S

## Zoom
    - Settings --> Recording --> "Record video during screen sharing" to record your video as a small thumbnail in the top-right

