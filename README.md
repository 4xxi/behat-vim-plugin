# behat-vim-plugin
#### About
##### Features
This plugin allows you to:
* search implementation of a step
* run .feature files

#### Quick start
##### 1. Set up plugin:
* Using [Vundle](https://github.com/VundleVim/Vundle.vim)
  Add `Plugin '4xxi/behat-vim-plugin'` to your vimrc
* Using `source` command
  Execute `git clone https://github.com/4xxi/behat-vim-plugin.git ~/.vim/bundle/behat-vim-plugin`
  Then open Vim and execute `:source ~/.vim/bundle/behat-vim-plugin/behat-vim-plugin.vim`
##### 2. Configure plugin:
1. Setup behat exec in your vimrc: `let g:behat_exe = <path>`
2. Setup behat configuration file in your vimrc: `let g:behat_config = <path>`

#### TODO
This plugin is a work in progress, so any ideas and patches are appreciated.
- [x] basic search of a step
- [x] run all scenarios from .feature file
- [ ] run specified scenario from .feature file
- [ ] step autocompletion
