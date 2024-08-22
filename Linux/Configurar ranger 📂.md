1. Abrir archivos con **nvim por default**

*/home/alejandro/.config/ranger/rifle.conf* 
```sh
# Define the "editor" for text files as first action
mime ^text,  label editor = nvim -- "$@"
mime ^text,  label pager  = $PAGER -- "$@"
!mime ^text, label editor, ext xml|json|csv|tex|py|pl|rb|rs|js|sh|php|dart = nvim -- "$@"
!mime ^text, label pager,  ext xml|json|csv|tex|py|pl|rb|rs|js|sh|php|dart = $PAGER -- "$@"
```