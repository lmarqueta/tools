# Git cheat sheet

## Configuracion inicial

```
git config --global user.email "Real Name"
git config --global user.email "<name@example.com>"

# Ver config
git config --list
```

## Crear repositorio

```
# Crear nuevo
cd Projects/project
git init

# Clonar uno existente
git clone ~/Projects/repo.git # de otro directorio
git clone https://github.com/twbs/bootstrap # de un servidor remoto

# Clonar a otro directorio
git clone https://github.com/twbs/bootstrap mybootstrap
```

## Staging index
```
git add <fichero>
git add . (añadir todos)
git status
```

## Confirmar (commit)

```
git commit -m "mensaje de commit"
```

Un commit se puede rectificar:
```
$ git commit -m 'initial commit'
$ git add forgotten_file
$ git commit --amend
```

## Eliminar archivos

```
rm <fichero>
git rm <fichero>
git commit -m "Eliminado <fichero> bla bla bla..."
```

## Deshacer cambios

Ojo, eliminar del **staging index**, no de un **commit**

```
git add <fichero> # Añadido por error
git reset HEAD <fichero>

# Otra forma, recuperando la última versión                                     
git checkout -- <fichero> # No recomendado, se pierden de forma irreversible    
                          # los cambios en ese fichero. Mejor branch            
```

## Log

```
git log
git log --oneline
git log --oneline --decorate
```

## Branches

La rama (branch) por defecto es **master**

```
# Ver branches:
git branch

# Crear branch (por ejemplo, "desarrollo")
git branch desarrollo
git checkout desarrollo # checkout

# las dos cosas a la vez:
git checkout -b desarrollo

# Borrar un brach
git branch -d desarrollo
```

## Merge

Combinar los cambios de distintas ramas. Se suele hacer

```
$ git branch
* desarrollo
  master

$ git log --oneline --decorate
8f75994 (HEAD -> desarrollo) Added Git cheat sheet
8bd4737 (origin/master, master) Initial commit

# Cambiamos a master:
$ git checkout master
Switched to branch 'master'

# Combinar
$ git merge desarrollo
Updating 8bd4737..8f75994
Fast-forward
 .vimrc            | 11 +++++++++++
 git-cheatsheet.md | 15 +++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 git-cheatsheet.md

# Ver resultado, comprobando que master se ha puesto al día con desarrollo:
$ git log --oneline --decorate
8f75994 (HEAD -> master, desarrollo) Added Git cheat sheet
8bd4737 (origin/master) Initial commit

# Si el branch se ha combinado bien y ha cumplido su función, se puede eliminar
git branch -d desarrollo

# Pero puede que hay conflictos. Git puede que los resuelva de forma
# automática o puede que no sea posible
```

### Conflictos

Supongamos que un fichero se ha modificado en las dos ramas:

```
$ git merge desarrollo
Auto-merging hola.txt
CONFLICT (add/add): Merge conflict in hola.txt
Automatic merge failed; fix conflicts and then commit the result.


t status
On branch master
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)

	both added:      hola.txt

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   git-cheatsheet.md

no changes added to commit (use "git add" and/or "git commit -a")

# Git añadirá unas marcas en el conflicto:
$ cat hola.txt
<<<<<<< HEAD
hola
adiós
=======
adios de parte de desarrollo
>>>>>>> desarrollo

Tendremos que editarlo manualmente y volver a añadir el fichero:
git add hola.txt
```

## Ver un commit anterior

```
$ git log --oneline
d62cc7b continuando con git cheat sheet
2435d0c hola de desarrollo
e8804d7 added hola
8f75994 Added Git cheat sheet
8bd4737 Initial commit
$ git checkout 8f75994
Note: checking out '8f75994'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at 8f75994... Added Git cheat sheet
```

Tendremos el código como estaba en ese momento y podremos crear un branch,
añadir una etiqueta (tag)...

Se puede hacer checkout a un tag si el commit está etiquetado

```
git tag v1.0

# Se puede tagear un commit antiguo con su código:
git tag v0.9 2435d0c

# Ver tags:
git tag
v1.0
v0.9
```

## Repositorios remotos

Cuando se clona, el repositorio original se añade automáticamente como remoto.
Pero se pueden añadir más:

```
git remote add <nombre> ~/Repos/repo.git
git remote add <nombre> https://github.com/nombre/repo

# Ej.:
git remote add origin ~/Owncloud/Projects/test.git

# A partir de ahí se p
git push <nombre_del_remoto> <branch>
git push origin master
```

## Actualizar con pull/fetch

Es conveniente hacer pulls de vez en cuando, sobre todo si en el proyecto
trabajan distintas personas

```
git pull origin master
```

## Referencias

* [Git documentation](https://git-scm.com/doc)
