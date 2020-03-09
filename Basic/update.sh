#!/bin/bash
cat > ~/update.sh <<EOF
sudo apt-get update
sudo apt-get -y upgrade
EOF
chmod +x ~/update.sh

