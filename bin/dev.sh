#!/usr/bin/env bash

DIR_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR_ROOT="$(realpath "$DIR_SCRIPT/..")"
DIR_SRC="$(realpath "$DIR_ROOT/src")"
DIR_DIST="$(realpath "$DIR_ROOT/dist")"

function cleanup {
    echo "Running HTMLTidy..."
    find "$DIR_DIST" -type f -name "*.html" -exec sh -c \
        "tidy -config "$DIR_ROOT/tidy.conf" -m \$0" {} \;
}

trap cleanup EXIT

hugo server \
    --renderToDisk \
    --cleanDestinationDir \
    --source "$DIR_SRC"
