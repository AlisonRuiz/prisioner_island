#!/bin/bash
sudo /etc/init.d/ssh start &> /dev/null
sudo -u prisoner -H sh -c "screen -S Jupyterlab -dm bash -c 'jupyter-lab --ip=0.0.0.0 --port=8888 --no-browser'"
sudo -u prisoner -H sh -c '/bin/bash'
