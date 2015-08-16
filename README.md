# Mis archivos de configuración

Mantiene una copia de los archivos de configuración en un sólo lugar para poder sincronizar todas las máquinas donde desarrollo.

## Links simbólicos

Por cada archivo de configuración hay que crear un link simbólico en el directorio de conexión para que puedan ser leídos por los correspondientes programas que los utilizan.

Por ejemplo:

```shell
ln -s .dotfiles/.vimrc .vimrc
```
