---
tags:
  - linux
  - cheatsheet
---
1. Instalar tmux

2. Clonar tmux-plugins
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

3. Crear configuración tmux
```sh
vim ~/.tmux.conf
```

4. Archivo **~/.tmux.conf**
```sh
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

5. Recargar configuración tmux (**dentro de tmux**)
```sh
tmux source-file ~/.tmux.conf
```

6. Por último instalar paquetes con TPM (tmux plugin manager)
- `Ctrl+B seguido de I`  (¡**mayúscula**!)
- `Reiniciar tmux`

7. Copiar en terminal con tmux (xd)
   1. **instalar plugin** `'tmux-plugins/tmux-yank'`
   2. `Ctrl+B seguido de I`  (¡**mayúscula**!)
   3. **Instalar dependencias**
      `sudo apt-get install xsel`
  4. **recargar configuración**
	 `tmux source-file ~/.tmux.conf`


   