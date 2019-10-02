#!/bin/bash
source ~/.aliases
ldisp
eval "$@" >> hist.txt
echo $@ >> hist.txt
