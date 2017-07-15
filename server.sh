#!/bin/bash

if [ $# -eq 0 ]; then
  echo "usage: ./server.sh <port>"
  exit 1
fi

socat TCP4-LISTEN:$1,fork EXEC:./handler.sh
