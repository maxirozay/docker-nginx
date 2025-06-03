#!/bin/sh

NAME="nginx"
SERVER_URL="debian@<ip>"
SSH_KEY="~/.ssh/<key>"
REMOTE_PATH="~/"

ssh -i $SSH_KEY $SERVER_URL "mkdir -p $REMOTE_PATH"
scp -i $SSH_KEY -r $(pwd) $SERVER_URL:$REMOTE_PATH
ssh -i $SSH_KEY $SERVER_URL "
  cd ~/$NAME && \
  sudo docker compose up -d
"
