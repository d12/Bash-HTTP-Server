# Bash-HTTP-Server
Fully (sort of) functional bash HTTP server. 

## What it does
- Responds to GET requests with webpages/files
- Can serve text and binary files
- Correctly sets response headers (including MIME type)
- Correctly sets HTTP response codes, and can load error pages for each error
- Ran a bootstrap webpage off of it as a test, all works perfectly

## What it doesn't do
- Execute PHP
- Handle URL parameters (easy fix, it will maybe be done some day)
- Run on a machine that means anything to you (there are a few minor security issues)

## Why?
- Wanted to learn bash
- Wanted to learn more about networking and architecture
- Decided to put em together

## How to use it
1. Put both files on your machine
2. `./server.sh`
3. Script will now handle GET requests to the IP on port 80 (default HTTP port)

By default, server root is `~/server`, can be configured by changing the first line in `grab_resource` to something else.
