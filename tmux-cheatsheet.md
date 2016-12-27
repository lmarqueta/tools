# tmux cheatsheet

`tmux` es un multiplexador de terminal. Tiene varias ventajas, pero la más clara es que permite reanudar una sesión en el punto en el que estaba después de una interrupción. Esto puede ser algo habitual en conexiones poco fiables (el ADSL de mi casa xD) o, más frecuentemente, cuando cierro el portátil y me voy con la música a otra parte.

tmux tiene sesiones, ventanas y paneles. Las sesiones son entornos de trabajo totalmente separados. Una sesión puede tener varias ventanas, visibles como distintas "pestañas". Las ventanas se ven a "pantalla completa". Finalmente, una ventana puede estar dividida en paneles (_panes_).

## Crear sesiones

Arrancar tmux:

No suelo tener más de una sesión abierta, pero es perfectamente posible hacerlo.

```shell
$ tmux new -s <nombre>

# Ver sesiones
$ tmux list-session
log: 1 windows (created Tue Dec 27 17:09:34 2016) [74x34]
ssh: 1 windows (created Tue Dec 27 17:09:40 2016) [74x34]

# Restaurar una sesión
tmux attach -t log

# Matar una sesión
tmux kill-session -t <nombre>
```

Los comandos, generalmente, se pueden abreviar. Por ejemplo:

```
# Estos comandos son equivalentes:
tmux attach -t log
tmux at -t log
tmux a -t log

# Estos también:
tmux list-sessions
tmux ls
```

## Prefix

Dentro de `tmux` hay que pulsar una cierta combinación de teclas (_prefix_) para ejecutar comandos. Por defecto es `Ctrl+b` o `^b`, aunque se puede cambiar.

Así, para desconectarse (_detach_) de una sesión, se utiliza `^b d`

## Comandos de sesión

Todos los comandos llevan por delante el prefijo (^b o el que se haya configurado en su lugar):

```
:new<CR>  new session
s  list sessions
$  rename session
d  detach
t  big clock :) 
?  help (list shortcuts)
:  prompt
```

## Comandos de ventana

```
c  create window
w  list windows
n  next window
p  previous window
f  find window
,  rename window
&  kill window
```

## Comandos de panel

```
%  vertical split
"  horizontal split

o  swap panes
cursor arrows - move between panes
q  show pane numbers
x  kill pane
+  break pane into window (e.g. to select text by mouse to copy)
-  restore pane from window
⍽  space - toggle between layouts (there are 5 predefined layouts)
<prefix> q (Show pane numbers, when the numbers show up type the key to goto that pane)
{ (Move the current pane left)
} (Move the current pane right)
z toggle pane zoom
```

Comandos para modificar el tamaño de los paneles:

```
: resize-pane -D (Resizes the current pane down)
: resize-pane -U (Resizes the current pane upward)
: resize-pane -L (Resizes the current pane left)
: resize-pane -R (Resizes the current pane right)
: resize-pane -D 20 (Resizes the current pane down by 20 cells)
: resize-pane -U 20 (Resizes the current pane upward by 20 cells)
: resize-pane -L 20 (Resizes the current pane left by 20 cells)
: resize-pane -R 20 (Resizes the current pane right by 20 cells)
: resize-pane -t 2 20 (Resizes the pane with the id of 2 down by 20 cells)
: resize-pane -t -L 20 (Resizes the pane with the id of 2 left by 20 cells)
```

aunque es mucho más sencillo:

```
^b Ctrl+arrow
```

Activar scroll (_copy mode_):


```
[ 
```

Es posible crear configuraciones personalizadas vía `.tmuxrc`, así como scripts que ejecuten ciertas órdenes al arrancar, pero nunca me ha hecho falta.
