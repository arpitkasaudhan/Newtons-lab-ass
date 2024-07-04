#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"  # Get the directory of this script
ENV_FILE="$DIR/.env"  # Construct absolute path to .env file

if [ -f "$ENV_FILE" ]; then
  source "$ENV_FILE"
else
  echo "Error: $ENV_FILE not found."
  exit 1
fi

PORT_DEFAULT="8099"
COLOR_GREEN="\033[0;32m"
COLOR_RESET="\033[0m"

# Check if WEB_PORT is defined
if [ ! -z "$WEB_PORT" ]; then
  # Start Next.js on WEB_PORT
  echo -e "$COLOR_GREEN\nWeb starting on port $WEB_PORT\n$COLOR_RESET"

  next start --port $WEB_PORT

else
  echo -e "$COLOR_GREEN\nWeb starting on port $PORT_DEFAULT\n$COLOR_RESET"
  echo -e "${COLOR_GREEN}You can change the starting port using the \$WEB_PORT environment variable.\n$COLOR_RESET"

  next start --port $PORT_DEFAULT

fi
