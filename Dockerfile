# Basado en el docker proporcionado por Tensorflow
# Construir con: docker build -t prisonerisland:latest -f ./Dockerfile ./Docker
# 
# Iniciar de la forma: docker run -it --name island -p 2222:2222 -p 8888:8888 --rm -v ${pwd}/workspace:/tf/prisoner/workspace prisonerisland:latest
# cambiar el ${pwd} por $(pwd) en consolas direferntes (linux-mac)
# Puede remover la bandera --rm si no desea borrar el contenido del contenedor al crearlo
FROM tensorflow/tensorflow:2.4.2-jupyter
LABEL maintainer=alisong.ruizr@gmail.com
RUN apt-get update -y
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata keyboard-configuration
RUN apt install apt-utils sudo screen nano openssh-server git python3-tk ffmpeg -y
RUN echo "Port 2222" >> /etc/ssh/sshd_config
RUN useradd -m -d /tf/prisoner prisoner
RUN /bin/bash -c 'echo -e "12345678\n12345678" | (passwd prisoner)'
RUN usermod -aG sudo prisoner
RUN sudo usermod -s /bin/bash prisoner
RUN echo "prisoner  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
WORKDIR /tf/prisoner
COPY . .
RUN chmod +x start.sh
RUN mv ./bash.bashrc /etc/bash.bashrc
RUN mv ./start.sh /etc/start.sh
RUN chown prisoner:prisoner /tf/prisoner/.bashrc
RUN chown -R prisoner:prisoner /tf/prisoner
RUN chmod -R 770 /tf/prisoner
RUN sudo -u prisoner -H sh -c 'touch /tf/prisoner/.hushlogin'
RUN sudo -u prisoner -H sh -c 'jupyter notebook --generate-config' &> /dev/null
RUN sudo -u prisoner -H sh -c 'mkdir /tf/prisoner/.jupyter'
RUN echo '{  "NotebookApp": {    "password": "sha1:6e8245d28424:3862af95d246881ed16cdf00f01fc5c115c87ded"  }}' >> /tf/prisoner/.jupyter/jupyter_notebook_config.json
RUN chown prisoner /tf/prisoner/.jupyter/jupyter_notebook_config.json
RUN chmod 770 /tf/prisoner/.jupyter/jupyter_notebook_config.json
RUN sudo -H python3 -m pip install --upgrade pip
RUN sudo -H python3 -m pip install jupyterlab pylint sklearn pandas seaborn
ENTRYPOINT "/etc/start.sh"
EXPOSE 8888
EXPOSE 2222
CMD ["/bin/bash"]
