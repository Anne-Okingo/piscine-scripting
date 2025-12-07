#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Error"
    exit 1
fi

DIR="$1"

if ! [[ -d "$DIR" ]]; then
    echo "Error"
    exit 1
fi

# ciao
touch "$DIR/ciao"
chmod 442 "$DIR/ciao"
touch -t 202401010001 "$DIR/ciao"

# mamma
mkdir "$DIR/mamma"
chmod 777 "$DIR/mamma"
touch -t 202401020001 "$DIR/mamma"

# guarda
touch "$DIR/guarda"
chmod 400 "$DIR/guarda"
touch -t 202401030001 "$DIR/guarda"

# come
touch "$DIR/come"
chmod 642 "$DIR/come"
touch -t 202401040001 "$DIR/come"

# mi
mkdir "$DIR/mi"
chmod 452 "$DIR/mi"
touch -t 202401050001 "$DIR/mi"

# diverto
touch "$DIR/diverto"
chmod 421 "$DIR/diverto"
touch -t 202401060001 "$DIR/diverto"
