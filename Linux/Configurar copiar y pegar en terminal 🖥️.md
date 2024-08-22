---
tags:
  - linux
  - cheatsheet
---
1. Abre tu archivo de configuración de shell
```sh
vim ./.zshrc
```
2. Configurar alias para xclip
```sh
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
```
3. Recargar zsh
```sh
source ~/.zshrc
```
