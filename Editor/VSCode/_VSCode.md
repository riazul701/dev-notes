# VSCode/VSCode.md

## Keyboard Shortcuts

* Anix Operating System  
  * "Ctrl+space" -> Open App Selector
  * Free "Ctrl+spce" keyboard shortcut, because it is used for IDE/Editor auto-completion.
  * Open program "Add Key (Add Key)"
  * Remove Item/Line: "Ctrl+space"
  * Add Item/Line: First Key: "Control"; Second Key: "Super" (Windows-Key); Third Key: "space"; Command: "app-select"
  * Restart PC

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

## [VSCodeVim/Vim](https://github.com/VSCodeVim/Vim)

* [Vim BY vscodevim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)

# References

* next-sl: {4}

## Websites

* [Visual Studio Code](https://code.visualstudio.com/)
* [coder/code-server](https://github.com/coder/code-server)

* Spacemacs-VSCode
  * [VSpaceCode Site](https://vspacecode.github.io/) || [GitHub: VSpaceCode/VSpaceCode](https://github.com/VSpaceCode/VSpaceCode)
  * [VSpaceCode BY VSpaceCode](https://marketplace.visualstudio.com/items?itemName=VSpaceCode.vspacecode)
  * [Which Key BY VSpaceCode](https://marketplace.visualstudio.com/items?itemName=VSpaceCode.whichkey)

* LunarVim-VSCode
  * {Selected} [LunarVim/vscode/settings.vim](https://github.com/LunarVim/LunarVim/blob/4625145d0278d4a039e55c433af9916d93e7846a/vscode/settings.vim) <sup>{1}: Comment->@chrisatmachine</sup>
  * {Selected} [LunarVim/utils/vscode_config/](https://github.com/LunarVim/LunarVim/tree/4625145d0278d4a039e55c433af9916d93e7846a/utils/vscode_config) <sup>{1}: Comment->@chrisatmachine</sup>
  * {Selected} [MohamedIrfanAM/neovim-windows GitHub => Windows-OS](https://github.com/MohamedIrfanAM/neovim-windows) <sup>{1}: Comment->@mohamedirfan2816</sup>
  * {Selected} [vscode-neovim/vscode-neovim](https://github.com/vscode-neovim/vscode-neovim) || [VSCode Neovim BY Alexey Svetliakov](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) <sup>{1}</sup>
  * {Selected} [VSpaceCode/vscode-which-key](https://github.com/VSpaceCode/vscode-which-key) || [Which Key BY VSpaceCode](https://marketplace.visualstudio.com/items?itemName=VSpaceCode.whichkey) <sup>{1}</sup>
  * Reference
    * [fathulfahmy/lunarkeymap](https://github.com/fathulfahmy/lunarkeymap) || [LunarKeymap BY Fathul Fahmy](https://marketplace.visualstudio.com/items?itemName=fathulfahmy.lunarkeymap)
    * [LunarVim VSCode Config: colinaaa/keybindings.json](https://gist.github.com/colinaaa/3376dc543f1ca9b10ee3f99b98c4fe0e)
    * [JrSchmidtt/lunar-vscode-theme](https://github.com/JrSchmidtt/lunar-vscode-theme) || [LunarVim Dark Theme BY Junior Schmidt](https://marketplace.visualstudio.com/items?itemName=JuniorSchmidt.lunar-vscode-theme)

* Extension
  * [laravel/vs-code-extension => Official Laravel VS Code Extension](https://github.com/laravel/vs-code-extension) || [Laravel BY Laravel](https://marketplace.visualstudio.com/items?itemName=laravel.vscode-laravel)
  * [DEVSENSE/phptools-docs GitHub](https://github.com/DEVSENSE/phptools-docs) || [PHP BY DEVSENSE](https://marketplace.visualstudio.com/items?itemName=DEVSENSE.phptools-vscode) <sup>{3}</sup>
  * [tomrijndorp/vscode-finditfaster GitHub => Find it, but faster! Fast file search for VS Code](https://github.com/tomrijndorp/vscode-finditfaster)

## Tutorials

* Debug
  * [PHP Code Debug Using XAMPP on VSCode Editor](https://medium.com/@asd66998854/php-code-debug-using-xampp-on-vscode-editor-97c5f6cc4487)
  * [Debug code with Visual Studio Code](https://code.visualstudio.com/docs/debugtest/debugging)

## YouTube Tutorials

* VSCode Vim/Neovim
  * {1} [VSCode with embedded Neovim BY chris@machine](https://www.youtube.com/watch?v=g4dXZ0RQWdw)
  * {2} [Can VSCode be a reasonable Spacemacs alternative? (VSpaceCode) BY Jack of Some](https://www.youtube.com/watch?v=XW32lPcWOxg)

* PHP
  * {3} [VSCode - The Complete Setup for PHP Development BY The Codeholic](https://www.youtube.com/watch?v=4zVObKFZ6fA)

* Debug
  * [Getting Started with Debugging in VS Code (Official Beginner Guide) BY Visual Studio Code](https://www.youtube.com/watch?v=3HiLLByBWkg)
  * [Setup debugging for PHP8.1 with XDebug 3 in VSCode BY The Codeholic](https://www.youtube.com/watch?v=HrQWtbxY1Hs)
  * [Setup Xdebug WITH DOCKER and debug in VSCode BY The Codeholic](https://www.youtube.com/watch?v=it7JQKPfWTU)

* Dev Containers
  * [Dev Containers BY Visual Studio Code => PlayList](https://www.youtube.com/playlist?list=PLj6YeMhvp2S6GjVyDHTPp8tLOR0xLGLYb)
