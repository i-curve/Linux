#!/bin/bash
cat >> ~/.bashrc <<EOF
alias tm='tmux'
EOF
read -p "Please type the name:" st
echo "export PS1=\"\\u@$st>\" " >> ~/.bashrc