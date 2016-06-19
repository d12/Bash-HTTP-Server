#!/bin/bash

response_code(){
  echo -n "HTTP/1.1 "
  case "$1" in
    200)
      echo "200 OK"
      ;;
    400)
      echo "400 Bad Request"
      ;;
    403)
      echo "403 Forbidden"
      ;;
    404)
      echo "404 Not Found"
      ;;
    *)
      echo "418 I'm a Teapot"
      ;;
  esac
}

print_headers(){
  response_code $1
  echo "Date: $(date)"
  echo "Connection: close"
  echo "Server: NatsServer"
  echo "Accept-Ranges: byes"
  echo ""
}

parse_URL(){
  #Extract path from resource line
  split_array=($1)
  parsed_url=${split_array[1]#?}
}

throw_400(){
  print_headers 400
  echo "Bad request!"
  exit 0
}

throw_404(){
  print_headers 404
  echo "Bad path, sorry :("
  exit 0
}

grab_resource(){
  cd ~/server
  IFS='/' read -ra path_arr <<< "$1"
  IFS=''
  len=${#path_arr[@]}
  count=0
  for i in "${path_arr[@]}"; do
    ((count++))
    if [ $count -eq $len ]; then
      if [ -f $i ]; then
       file_output=$(<$i)
      else
        throw_404
      fi
    else
      cd $i || throw_404
    fi
  done
}

read -r line || throw_400

parse_URL "$line"

grab_resource $parsed_url

print_headers 200

echo $file_output