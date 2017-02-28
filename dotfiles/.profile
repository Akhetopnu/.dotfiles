#!/bin/bash

alias cp="cp -i"

export PATH="$HOME/node_modules/.bin:$PATH"
export GPG_TTY=$(tty)
export BROWSER=firefox

eval `ssh-agent -s` > /dev/null
