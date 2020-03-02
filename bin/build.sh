#!/usr/bin/env bash

# ============================================================================
# https://blog.zikes.me/post/quality-of-life-improvements/
# ============================================================================

DIR_SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR_ROOT="$(realpath "$DIR_SCRIPT/..")"
DIR_SRC="$(realpath "$DIR_ROOT/src")"
DIR_DIST="$(realpath "$DIR_ROOT/dist")"

hugo \
    --cleanDestinationDir \
    --source "$DIR_SRC" && \
    find "$DIR_DIST" -type f -name "*.html" -exec sh -c \
        "tidy -config "$DIR_ROOT/tidy.conf" -m \$0" {} \;
