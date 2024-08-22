---
tags:
  - cheatsheet
  - obsidian
---
### Quick Tips
- To Search for a specific note: Use Ctrl + O .

---
# Shortcuts ⌨️

### General Shortcuts 🕹️
|    Shortcut Key    |                     Functions |
| :----------------: | ----------------------------: |
|      Ctrl + S      |        Editor: Saves the file |
|      Ctrl + N      |            Creates a new note |
|      Ctrl + P      |          Open command pallete |
|      Ctrl + O      |          Opens Quick Switcher |
|  Ctrl + Shift + F  |           Search in all files |
|      Ctrl + G      |              Opens graph view |
|  Ctrl +  Alt + ←   |                 Navigate Back |
|  Ctrl +  Alt + →   |                Navigate forth |
|      Ctrl + F      |         Searches current file |
|      Ctrl + E      |     Toggle edit/preview modes |
|      Ctrl + ,      |                 Open Settings |
|     Ctrl + Tab     |                      Next tab |
| Ctrl + Shift + Tab |                  Previous tab |
|     Alt + Tab      |                      Next App |
| Alt + Shift + Tab  |                  Previous App |
|     Win + Tab      |                     Task View |
| Win + Shift + Tab  |                   Next Window |
|  Ctrl + Shift + *  |      Abrir en app por defecto |
|      Ctrl + \      |  Abrir explorador de archivos |
|      Alt + N       | Create new note from template |
### Editing Shortcuts 🕹️
|               Shortcut Key                |                             Functions |
| :---------------------------------------: | ------------------------------------: |
|                 Ctrl + B                  |                    Bold Selected Text |
|                 Ctrl + I                  |               Italicize Selected Text |
|                 Ctrl + K                  | Insert External Link to Selected Text |
|                 Ctrl + ]                  |                                Indent |
|                 Ctrl + [                  |                              Unindent |
|                 Ctrl + D                  |                   Delete current line |
|                 Ctrl + V                  |                Duplicate current line |
|               Ctrl + Click                |   Open Note in Current Panel via Link |
|           Ctrl + Shift + Click            |       Open Note in New Panel via Link |
|                 Ctrl + N                  |                              New Note |
|         Ctrl + P (Cmd + P on Mac)         |                          Quick Search |
| Ctrl + Shift + D (Cmd + Shift + D on Mac) |                   Create a Daily Note |
|                 Ctrl + /                  |                Toggle Command Palette |
|                 Ctrl + E                  |         Alternar ver/editar documento |
|   Ctrl + Click (Cmd + Click on Mac)<br>   |                 Open Link in New Pane |
|                  Ctrl +                   |                                       |


# Markdown Cheat Sheet 💻
<em><strong>Quick Overview ✨</em></strong> 

## Enlaces
| Tipo de Enlace                 | Sintaxis                                           |
| ------------------------------ | -------------------------------------------------- |
| Enlace a una nota              | `[[Nombre de la nota]]`                            |
| Enlace a un encabezado         | `[[Nombre de la nota#Encabezado]]`                 |
| Enlace a un bloque             | `[[Nombre de la nota^Bloque]]`                     |
| Enlace con texto personalizado | `[[Obsidian Cheat Sheet 🔮\|Obsidian cheatsheet]]` |
| Enlace a un sitio web          | `[Texto del enlace](URL)`                          |

## Embedding in Obsidian

Embedding a note within another note is a great way to keep content up-to-date. If you copied and pasted the content, later you would need to update the original and then anywhere you pasted it.

By embedding the original note into new notes, you only have to update the original and all will be updated.

```
![[Note to Embed]]
```

Blocks can also be embedded if you don’t want the entire note.

```
![[linkexample^Block]]
```

Headings too.

```
![[linkexample#Heading]]
```

The trick for changing the display text will work when embedding too.

```
![[linkexample|Change Display Text]]
```

### Embedding Images and Other Files in Obsidian Notes

Imagenes
```md
![[Image.jpg]]
![Image](https://facedragons.com/wp-content/uploads/2022/08/cropped-roundlogo-FD.png)
```

Videos
```md
![[Video.mp4]]
```

Audios
```md
![[Audio.mp3]]
```

PDF's
```md
![[Document.pdf]]
```

Table of supported file types and formats

1. Markdown files: `md`;
2. Image files: `png`, `jpg`, `jpeg`, `gif`, `bmp`, `svg`;
3. Audio files: `mp3`, `webm`, `wav`, `m4a`, `ogg`, `3gp`, `flac`;
4. Video files: `mp4`, `webm`, `ogv`;
5. PDF files: `pdf`.

## Formato de Texto
| Elemento  | Sintaxis      | Ejemplo                       |
| --------- | ------------- | ----------------------------- |
| Negrita   | `**texto**`   | **Texto en negrita**          |
| Cursiva   | `*texto*`     | *Texto en cursiva*            |
| Tachado   | `~~texto~~`   | ~~Texto tachado~~             |
| Negrita+  | `***texto***` | ***Texto negrita y cursiva*** |
| Resaltado |               | ==Texto resaltado==           |

## Notas al pie
| Sintaxis    | Ejemplo                                      |
| ----------- | -------------------------------------------- |
| Nota al pie | Texto con una nota al pie^[Texto de la nota] |


