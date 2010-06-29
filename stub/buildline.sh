#!/bin/sh
gcc -g -shared -Wl,--export-all -o ../ansi-terminal-stub.so ansi-terminal-stub.c
