# LunarVim-Like-Keybind.md

## Instructions: Make VSCode Like LunarVim

* Do Not Use VSCode's `Vim` Extension, Use `Neovim` Extension Instead.

* Install `vscode-neovim` extension from [vscode-neovim/vscode-neovim GitHub](https://github.com/vscode-neovim/vscode-neovim) || [VSCode Neovim BY Alexey Svetliakov](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) <sup>{3}</sup>
  * This extension uses real `neovim` with neovim's extensions.
  * On extension settings, check `neovim` executable path is correct or not, after changing VSCode's `settings.json` file.

* Install `which-key` extension from [VSpaceCode/vscode-which-key GitHub](https://github.com/VSpaceCode/vscode-which-key) || [Which Key BY VSpaceCode](https://marketplace.visualstudio.com/items?itemName=VSpaceCode.whichkey) <sup>{4}</sup>

* Download `settings.vim` file from [LunarVim/vscode/settings.vim](https://github.com/LunarVim/LunarVim/blob/4625145d0278d4a039e55c433af9916d93e7846a/vscode/settings.vim) <sup>{5} {Selected}</sup> and save it to `$HOME/.vscode/settings.vim` path.

* Download `init.vim` file from [LunarVim/init.vim](https://github.com/LunarVim/LunarVim/blob/4625145d0278d4a039e55c433af9916d93e7846a/init.vim) <sup>{6} {Selected}</sup> and save it to `$HOME/.vscode/init.vim` path.
  * If there is no `neovim` extension installed (fresh `neovim` installed), then reduce code like this:

```shell
" General Settings

if exists('g:vscode')
  " VS Code extension
  source $HOME/.vscode/settings.vim
endif

" Better nav for omnicomplete TODO figure out why this is being overridden
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
```

* Open VSCode and go to `File -> Preferences -> Keyboard Shortcuts -> Open Keyboard Shortcuts (JSON)`.
  * Get keyboard shortcuts `json` content from [LunarVim/utils/vscode_config
/keybindings.json](https://github.com/LunarVim/LunarVim/blob/4625145d0278d4a039e55c433af9916d93e7846a/utils/vscode_config/keybindings.json) <sup>{7} {Selected}</sup> and paste into VSCode's `Keyboard Shortcuts (JSON)` file.

* Open VSCode and go to `File -> Preferences -> Settings -> Open Settings (JSON)`.
  * Get settings `json` content from [LunarVim/utils/vscode_config/settings.json](https://github.com/LunarVim/LunarVim/blob/4625145d0278d4a039e55c433af9916d93e7846a/utils/vscode_config/settings.json) <sup>{7} {Selected}</sup> and paste into VSCode's `Settings (JSON)` file.
  * Get Windows-OS neovim's `neovimInitVimPaths` and `neovimExecutablePaths` from [neovim-windows/utils/vscode_config/settings.json](https://github.com/MohamedIrfanAM/neovim-windows/blob/main/utils/vscode_config/settings.json) <sup>{8} {Selected}</sup> and paste into VSCode's `Settings (JSON)` file like this:

```shell
{
  "vscode-neovim.neovimExecutablePaths.darwin": "/usr/local/bin/nvim",
  "vscode-neovim.neovimExecutablePaths.linux": "/usr/bin/nvim",
  "vscode-neovim.neovimExecutablePaths.win32": "C:\\Program Files\\Neovim\\bin\\nvim.exe",
  "vscode-neovim.neovimInitVimPaths.darwin": "$HOME/.config/nvim/init.vim",
  "vscode-neovim.neovimInitVimPaths.linux": "$HOME/.config/nvim/init.vim",
  "vscode-neovim.neovimInitVimPaths.win32": "C:\\Users\\Mohamed Irfan\\AppData\\Local\\nvim\\init.vim",
............................................................................
}
```

# VIM Extension

## [vscode-neovim/vscode-neovim](https://github.com/vscode-neovim/vscode-neovim) 

* [VSCode Neovim BY Alexey Svetliakov](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)

## Notes

* Vim's folding keybindings do not work in VSCode.

### Code navigation bindings

| Key                     | VSCode Command |
| ----------------------- | ------------- |
| `=` / `==`              | `editor.action.formatSelection` |
| `gh` / `K`              | `editor.action.showHover` |
| `gd` / `C-]`            | `editor.action.revealDefinition` <br/> Also works in vim help. |
| `gf`                    | `editor.action.revealDeclaration` |
| `gH`                    | `editor.action.referenceSearch.trigger` |
| `gO`                    | `workbench.action.gotoSymbol` |
| `C-w` `gd` / `C-w` `gf` | `editor.action.revealDefinitionAside` |
| `gD`                    | `editor.action.peekDefinition` |
| `gF`                    | `editor.action.peekDeclaration` |
| `Tab`                   | `togglePeekWidgetFocus` <br/> Switch between peek editor and reference list. |
| `C-n` / `C-p`           | Navigate lists, parameter hints, suggestions, quick-open, cmdline history, peek reference list |

> 💡 To specify the default peek mode, modify `editor.peekWidgetDefaultFocus` in your settings.

### Explorer/list navigation bindings

| Key               | VSCode Command                  |
| ----------------- | ------------------------------- |
| `j` or `k`        | `list.focusDown/Up`             |
| `h` or `l`        | `list.collapse/select`          |
| `Enter`           | `list.select`                   |
| `gg`              | `list.focusFirst`               |
| `G`               | `list.focusLast`                |
| `o`               | `list.toggleExpand`             |
| `C-u` or `C-d`    | `list.focusPageUp/Down`         |
| `zo` or `zO`      | `list.expand`                   |
| `zc`              | `list.collapse`                 |
| `zC`              | `list.collapseAllToFocus`       |
| `za` or `zA`      | `list.toggleExpand`             |
| `zm` or `zM`      | `list.collapseAll`              |
| ` / ` or `Escape` | `list.toggleKeyboardNavigation` |

### Explorer file manipulation bindings

| Key          | VSCode Command                                |
| ------------ | --------------------------------------------- |
| `r` | `renameFile`                                  |
| `d` | `deleteFile`                                  |
| `y` | `filesExplorer.copy`                          |
| `x` | `filesExplorer.cut`                           |
| `p` | `filesExplorer.paste`                         |
| `v` | `explorer.openToSide`                         |
| `a` | `explorer.newFile`                            |
| `A` | `explorer.newFolder`                          |
| `R` | `workbench.files.action.refreshFilesExplorer` |

### Hover widget manipulation bindings

| Key            | VSCode Command                   |
| -------------- | -------------------------------- |
| `K`   | `editor.action.showHover`        |
| `h`   | `editor.action.scrollLeftHover`  |
| `j`   | `editor.action.scrollDownHover`  |
| `k`   | `editor.action.scrollUpHover`    |
| `l`   | `editor.action.scrollRightHover` |
| `gg`  | `editor.action.goToTopHover`     |
| `G`   | `editor.action.goToBottomHover`  |
| `C-f` | `editor.action.pageDownHover`    |
| `C-b` | `editor.action.pageUpHover`      |

# References

* next-sl: {17}

## Websites

* LunarVim-VSCode
  
  * {5} {Selected} [LunarVim/vscode/settings.vim](https://github.com/LunarVim/LunarVim/blob/4625145d0278d4a039e55c433af9916d93e7846a/vscode/settings.vim) <sup>{1}: Comment->@chrisatmachine</sup>

  * {6} {Selected} [LunarVim/init.vim](https://github.com/LunarVim/LunarVim/blob/4625145d0278d4a039e55c433af9916d93e7846a/init.vim)
  
  * {7} {Selected} [LunarVim/utils/vscode_config/](https://github.com/LunarVim/LunarVim/tree/4625145d0278d4a039e55c433af9916d93e7846a/utils/vscode_config) <sup>{1}: Comment->@chrisatmachine</sup>
  
  * {8} {Selected} [MohamedIrfanAM/neovim-windows GitHub => Windows-OS](https://github.com/MohamedIrfanAM/neovim-windows) <sup>{1}: Comment->@mohamedirfan2816</sup>
  
  * {9} {Selected} [vscode-neovim/vscode-neovim](https://github.com/vscode-neovim/vscode-neovim) || [VSCode Neovim BY Alexey Svetliakov](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) <sup>{1}</sup>
  
  * {10} {Selected} [VSpaceCode/vscode-which-key](https://github.com/VSpaceCode/vscode-which-key) || [Which Key BY VSpaceCode](https://marketplace.visualstudio.com/items?itemName=VSpaceCode.whichkey) <sup>{1}</sup>
  
  * References (LunarVim-VSCode)
    
    * {11} [fathulfahmy/lunarkeymap](https://github.com/fathulfahmy/lunarkeymap) || [LunarKeymap BY Fathul Fahmy](https://marketplace.visualstudio.com/items?itemName=fathulfahmy.lunarkeymap)
    
    * {12} [LunarVim VSCode Config: colinaaa/keybindings.json](https://gist.github.com/colinaaa/3376dc543f1ca9b10ee3f99b98c4fe0e)
    
    * {13} [JrSchmidtt/lunar-vscode-theme](https://github.com/JrSchmidtt/lunar-vscode-theme) || [LunarVim Dark Theme BY Junior Schmidt](https://marketplace.visualstudio.com/items?itemName=JuniorSchmidt.lunar-vscode-theme)

* Spacemacs-VSCode

  * {14} [VSpaceCode Site](https://vspacecode.github.io/) || [GitHub: VSpaceCode/VSpaceCode](https://github.com/VSpaceCode/VSpaceCode)
  
  * {15} [VSpaceCode BY VSpaceCode](https://marketplace.visualstudio.com/items?itemName=VSpaceCode.vspacecode)
  
  * {16} [Which Key BY VSpaceCode](https://marketplace.visualstudio.com/items?itemName=VSpaceCode.whichkey)

## VSCode Extensions

* LunarVim-VSCode

  * {3} [vscode-neovim/vscode-neovim GitHub](https://github.com/vscode-neovim/vscode-neovim) || [VSCode Neovim BY Alexey Svetliakov](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)

  * {4} [VSpaceCode/vscode-which-key GitHub](https://github.com/VSpaceCode/vscode-which-key) || [Which Key BY VSpaceCode](https://marketplace.visualstudio.com/items?itemName=VSpaceCode.whichkey)

* Other Extensions

  * [VSCodeVim/Vim GitHub](https://github.com/VSCodeVim/Vim) || [Vim BY vscodevim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
    * Do Not Use This `Vim` Extension, Use `Neovim` Extension Instead.

## YouTube Tutorials

* VSCode Vim/Neovim
  * {1} [VSCode with embedded Neovim BY chris@machine](https://www.youtube.com/watch?v=g4dXZ0RQWdw)
  * {2} [Can VSCode be a reasonable Spacemacs alternative? (VSpaceCode) BY Jack of Some](https://www.youtube.com/watch?v=XW32lPcWOxg)
