#!/bin/bash
cat >> ~/.bashrc <<EOF
alias tm='tmux'
EOF
read -p "������:" st
echo "export PS1=\"\\u@$st>\"" >> ~/.bashrc
