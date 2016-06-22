#!/bin/bash
socat TCP4-LISTEN:80,fork EXEC:./handler.sh
