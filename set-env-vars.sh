#!/bin/bash

export MY_NUM=100
export MY_PI=3.142
export MY_MESSAGE="Hello World"

printenv | grep -E '^MY_(NUM|PI|MESSAGE)='
