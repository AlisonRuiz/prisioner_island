# Prisioner Island
Alison Gissell Ruiz Ruiz

Este proyecto contiene la solución a 3 desafios propuestos relacionados a data science. El contenido del desarrollo se encuentra en la carpeta workspace, donde cada solución posee su carpeta con el nombre relacionado al reto, los documentos ipynb contienen el desarrollo y explicación con el paso a paso realizado en cada uno de los puntos. El proyecto cuenta con dockerización, los pasos requeridos para emplearlo son:

## Configuración del entorno docker
Instalar y configurar docker en su sistema operativo.

| OS | Enlace |
| --- | --- |
| Windows y Mac | [Docker desktop](https://docs.docker.com/desktop/) |
| Linux |  [Docker Engine](https://docs.docker.com/engine/install/) |

En una terminal abierta en el mismo directorio de este repositorio ejecutar:

```bash
docker build -t prisonerisland:latest -f ./Dockerfile ./Docker
```

con esto ya deberia tener la imagen prisonerisland lista para su uso en su equipo, ahora, para correr una instancia de esta imagen ejecutar:

```bash
docker run -it --name island -p 2222:2222 -p 8888:8888 --rm -v ${pwd}/workspace:/tf/prisoner/workspace prisonerisland:latest
```

Esto le permitirá tener una terminal abierta dentro del contenedor, que estará ejecutando Jupiter-lab y un servidor SSH en el puerto 2222, si esta usando linux o mac deberá cambiar \${pwd} por $(pwd) para no generar errores.

Si esta usando Windows o Mac, o por alguna razon no le permite acceder al puerto del Jupyter-lab, puede usar redireccionamiento de puertos por SSH de la siguiente manera:

*En una nueva termina, no importa si no es en el directorio del repositorio.

```bash
ssh -L 8888:localhost:8888 -p2222 prisoner@DOCKER-IP
```

Reemplazando DOCKER-IP por la ip del adaptador de red de docker en el equipo host (generalmente es 172.22.64.1 pero puede llegar a cambiar).
