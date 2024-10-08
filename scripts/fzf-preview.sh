#!/usr/bin/env bash

case "$1" in
preview)
    row="$2"
    if echo "$row" | grep -vqP '^\d+\t\[\[ binary data .* \]\]'; then
        echo "$row" | cliphist decode 
    else
        echo "$row" | cliphist decode | chafa -f sixel -s "${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}"
        # echo "$row" | cliphist decode | img2sixel -c "${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}"
    fi
    ;;

*)
    id="$(cliphist list | fzf --preview "$(realpath "$0") preview {}")"
    test -z "$id" && exit

    cliphist decode <<<"$id" | wl-copy
    ;;

esac
