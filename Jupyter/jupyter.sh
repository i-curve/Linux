#!/bin/bash
echo "System required Ubuntu18"
sleep 1
read -p "y/n" check
[ "$check" != "y" ] && echo "exit" && exit 0
sudo apt-get update
sudo apt-get -y install jupyter
jupyter-notebook --generate-config
mkdir ~/jupyter
jupyter-notebook password
cat >> ~/.jupyter/jupyter_notebook_config.py << EOF
c.NotebookApp.notebook_dir = '$HOME/jupyter' 
c.NotebookApp.ip='0.0.0.0' 
c.NotebookApp.open_browser = False 
c.NotebookApp.port = 8888
EOF
echo 'OK,please start sudo jupyter-notebook --allow-root'

