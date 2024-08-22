---
tags:
  - linux
  - cheatsheet
---
1. Vim-plug github
```http
https://github.com/junegunn/vim-plug
```
2. Ejecutar comando de instalación
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
3. Accedemos / creamos fichero `~/.config/nvim/init.vim` y metemos configuración necesaria de plugins
```
call plug#begin()
Plug 'vim-airline/vim-airline'
call plug#end()
set rnu
```
4. Recargar configuración (dentro de nvim)
`:source %`
5. Instalar plugins
`:PlugInstall`
6. Instalar todos los plugins que quieras mediante VimAwesome
```HTTP
https://vimawesome.com/plugin/
```

## Configuración personal de nvim

```sh
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
""Markdown
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
""URL Encoder
Plug 'roxma/vim-encode'
call plug#end()
set rnu


""NerdTree_configuration
nmap <C-f> :NERDTreeToggle<CR>

" Telescope
nnoremap <F2> <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
```
## Listar plugins vim

Ejecuta el comando
```
:PlugStatus
```

