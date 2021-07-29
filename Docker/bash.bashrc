export PS1='\[\033[0;32m\]\h:\[\033[36m\]\w\[\033[0m\] \$ '
export USER=user
export DISPLAY=:1
export PATH="/opt/TurboVNC/bin/:$PATH"
if [[ $- == *i* ]]; then
    echo -e "Jupyterlab y el servidor SSH se inician automaticamente, contraseñas: 12345678"
    echo -e "Abre Jupyterlab en el navegador con http://localhost:8888/"
    echo -e "Conectate por SSH con 'ssh -p2222 prisoner@localhost', puedes ver las carpetas por sftp con 'sftp://prisoner@localhost:2222/tf/prisoner'"
    echo -e "En ocasiones pueden presentarse problemas al exponer puertos con docker"
    echo -e "Utiliza este comando en una nueva terminal del host (no docker) para redireccionar el puerto:"
    echo -e "ssh -L 8888:localhost:8888 -p2222 prisoner@DOCKER-IP"
fi
