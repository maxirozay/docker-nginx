#!/bin/bash

set -a
if [ -f ".env" ]; then
  . ".env"
fi
set +a

NAME="nginx"
SERVER_URL="$SERVER_URL"
SSH_KEY="~/.ssh/$SSH_KEY_NAME"
REMOTE_PATH="~/nginx"
echo "Deploying to $SERVER_URL with SSH key $SSH_KEY_NAME"

ssh -i $SSH_KEY $SERVER_URL "mkdir -p $REMOTE_PATH"
scp -i $SSH_KEY -r $(pwd)/nginx $SERVER_URL:$REMOTE_PATH
scp -i $SSH_KEY -r $(pwd)/sites $SERVER_URL:$REMOTE_PATH
scp -i $SSH_KEY -r $(pwd)/compose.yaml $SERVER_URL:$REMOTE_PATH
scp -i $SSH_KEY -r $(pwd)/README.md $SERVER_URL:$REMOTE_PATH
ssh -i $SSH_KEY $SERVER_URL "
  cd $REMOTE_PATH && \
  sudo docker compose up -d
"
