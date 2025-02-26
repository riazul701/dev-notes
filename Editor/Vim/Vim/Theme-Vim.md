# Theme-Vim.md

## Websites

* Plugin Manager
  * [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
  * [Shougo/dein.vim](https://github.com/Shougo/dein.vim)

* Configure Theme
  * [Load different colorscheme when using vimdiff](https://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff)
  * [Vim Color Schemes: How to Configure](https://phoenixnap.com/kb/vim-color-schemes)
  * [vimcolorschemes.com](https://vimcolorschemes.com/i/trending) || [vimcolorschemes/vimcolorschemes GitHub](https://github.com/vimcolorschemes/vimcolorschemes)

* Theme Collection
  * [catppuccin/vim GitHub](https://github.com/catppuccin/vim)

# Configuration

## Set Vim Theme

### [Vim Color Schemes: How to Configure](https://phoenixnap.com/kb/vim-color-schemes)

* Note: This guide is also applicable to NeoVim, which extends Vim with additional features. However, NeoVim instances usually utilize an init.vim file instead of a .vimrc for configuration settings. The init.vim file is commonly located at ~/.config/nvim/init.vim.

**Built-in Vim Color Schemes**

* When you install Vim, it selects a standard color scheme based on your terminal's appearance settings. 

* The text editor uses a default scheme, which depends on whether a light or dark terminal is used. The default Vim color scheme in a light terminal is `peachpuff`. In a dark terminal, the initial color scheme is `ron`.

**How to Install a New Vim Color Scheme**

* Two main ways to install a new Vim color scheme are manually or via a plugin. The following text elaborates on both methods.

**Download Vim Color Scheme Manually**

* A wide variety of user-made color schemes may better suit your needs than the default options. Find and download schemes from GitHub or websites such as [vimcolorschemes](https://vimcolorschemes.com/).

**To get new color schemes manually, take the following steps:**

* Access the website with the color schemes. In this case, it's GitHub.

* Scroll down until you find the scheme that works for you. In this example, it's `gruvbox`.

* Click the `morhetz/gruvbox` link.

* Click the `colors` directory. This is where the color scheme files are stored.

* Inside the `colors` directory, find and click the `gruvbox.vim` file.

* Click the `Raw` button in the top-right corner.

* Note the `URL` in your `browser's` address bar. It is the direct link to the raw file.

* Create the `/.vim/colors` directory using the `mkdir` command: `mkdir -p ~/.vim/colors`

* Use `wget` to download and install the color scheme. The syntax is: `wget [URL] -O ~/.vim/colors/[scheme_name].vim`

* For example, in this case: 
```
wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -O ~/.vim/colors/gruvbox.vim
```

* The command consists of:
  
  * `wget`. A command-line utility used to download files from the internet.
  
  * `https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim`. The URL of the file you want to download.
  
  * `-O`. Option which tells `wget` to save the downloaded file with a specific name and path.
  
  * `~/.vim/colors/gruvbox.vim`. The path and name where the downloaded file is saved.
    * `~/.vim/colors/` is the directory where Vim color schemes are stored.
  
  * `gruvbox.vim`. The name of the file. In the example, the file is saved as `gruvbox.vim` in the `~/.vim/colors/` directory.
  
  * Verify the download with the [ls command](https://phoenixnap.com/kb/linux-ls-commands): `ls ~/.vim/colors`
  
  * Open Vim.
  
  * Access the command mode by pressing the `Escape` key and typing `:`
  
  * Run the following and press Enter: `colorscheme gruvbox`
  
  * Vim changes color according to the new scheme. Note that the change lasts only during the current session.

**Install Vim Color Scheme Using Plugins**

* Installing Vim color schemes using plugins is more convenient, especially if you use a plugin manager. One popular Vim plugin manager is `vim-plug`. Take the following steps to install Vim color schemes using `vim-plug`.

* Access GitHub.

* Search for and click `vim-plug`.

* Scroll down to the `Installation` section and select `Click to see the instructions`.

* Copy the code starting with `curl` and paste it into the terminal to install `vim-plug`.
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

* Open the .vimrc file: `vim ~/.vimrc`

* Add the following lines to install the color scheme plugin. For example, to install the `gruvbox` color scheme
```
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()
colorscheme gruvbox
```

* Open Vim and run the following command to install the plugins defined in your `.vimrc` : `:PlugInstall`

* After `PlugInstall` finishes, the `gruvbox` color scheme is applied. If it is not, set it by running: `colorscheme gruvbox`

**View Installed Vim Color Schemes**

* To see a list of ready-to-use themes, open any document using the Vim editor and use the following instruction: `colorscheme [space] [Ctrl+d]`

* The output shows a list of Vim color schemes:

**How to Change Vim Color Scheme**

* There are two ways to change Vim colors: changing the color scheme or changing individual colors. The following text elaborates on both methods.

**Change Vim Color Scheme**

* After prompting Vim to display a color scheme list, change the design until you find a suitable one.

* To change the Vim color scheme, use the following: `colorscheme [colorscheme_name]`

* You can also use an abbreviation: `colo [colorscheme_name]`

* For example, to switch to the color scheme `blue`, use: `colorscheme blue`

**Manually Change Vim Colors**

* Another way to customize Vim colors is to configure the color settings manually.

* The syntax is: `highlight [Group] [key=value]`

* The command consists of:

  * `highlight`. Defines or modifies the highlighting attributes of syntax groups.
  * `[Group]`. Specifies the name of the syntax group you want to highlight. Syntax groups are predefined collections of text elements in Vim (e.g., comment, keyword, string, error message, non-text, etc.).
  * `[key=value]`. The attributes you set for the specified group. You can set multiple attributes by separating them with spaces. Common attributes include:

    * `cterm`. Attributes for terminals that support color.
    * `ctermfg`. Foreground color for terminals.
    * `ctermbg`. Background color for terminals.
    * `gui`. Attributes for graphical Vim (GVim).
    * `guifg`. Foreground color for GVim.
    * `guibg`, Background color for GVim.
    * `guiattr`. Additional GUI attributes (e.g., bold, underline, etc.).

* When specifying the values for `ctermfg`, `ctermbg`/`guifg`, and `guibg`, use standard color names, their prescribed numbers, or hex values (only in the GUI).

* However, `cterm` and `gui` are not used with color values. Instead, the values you use for these highlight keys include bold, italic, underline, reverse, and none.

* Note: You can substitute `highlight` with `hi` for short.

* The following example shows how the `highlight` command works.

* For instance, the file has the default color scheme in Vim:

* Set all `Normal` text to red (foreground) and the background color to black. Type the following:
```
hi Normal ctermfg=Red ctermbg=Black
```

* Press Enter, and the colors automatically change, as in the image below.

**How to Set Default Vim Color Scheme**

* Changes made to the color settings are not permanent. Once you close Vim, the color scheme returns to the default settings.

* To make the changes permanent, modify Vim's configuration file with the wanted color settings. Take the following steps:

  * Open the `.vimrc` file in Vim. If the file does not exist, this command creates it. `vim ~/.vimrc`
  * Add the following line to set the default color scheme. `syntax on colorscheme [your_color_scheme]`
  * The `syntax on` instructs Vim to highlight code syntax based on the file type. Different code elements (like keywords, comments, strings, etc.) are colored differently, making it easier to read and understand the code.
  * Test the command by choosing one color scheme. For instance, to set `gruvbox` as your default color scheme, add: `syntax on colorscheme gruvbox`
  * Save and exit the file.

**Conclusion**

* This article showed how to set up and use default or custom Vim color schemes.

* Next, learn [important Vim commands](https://phoenixnap.com/kb/vim-commands-cheat-sheet).

## Different Theme for Vimdiff

### [Load different colorscheme when using vimdiff](https://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff)

* If you're calling `vimdiff` from the command-line, put the following in your `.vimrc`:
```
if &diff
    colorscheme some_other_scheme
endif
```

* (if you're already in vimdiff => `:colorscheme some_other_scheme` thanks dlaehnemann)

* If you're using vimdiff from within vim, you'd either have to override the commands you use to start/stop it (e.g. `diffthis`, `diffoff`) using `:cnoreabbr` (there's also a [plugin](http://www.vim.org/scripts/script.php?script_id=746)) or use an autocommand:

* `au FilterWritePre * if &diff | colorscheme xyz | endif`

* FilterWritePre is called before filtering through an external program (the diff utility) and the `&diff`-option is set by vim when it's going into diff-mode (among others, see `:help diff`)

* I'm not sure which autocommand to use to return to the original colorscheme though.

## Final `.vimrc` Contents

```
call plug#begin()
" List your plugins here
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme catppuccin_mocha
if &diff
    colorscheme gruvbox
endif
```
