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
##### 2. Configure plugin:
1. Setup behat exec in your vimrc: `let g:behat_exe = <path>`
2. Setup behat configuration file in your vimrc: `let g:behat_config = <path>`

#### TODO
This plugin is a work in progress, so any ideas and patches are appreciated.
- [x] basic search of a step
- [x] run all scenarios from .feature file
- [ ] improve syntax highlighting
- [ ] run specified scenario from .feature file
- [ ] step autocompletion
