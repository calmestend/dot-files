

    #!/bin/bash

    while true
    do
    player_status=$(playerctl -p spotify status 2> /dev/null)

    if [ "$player_status" = "Playing" ]; then
    artist=$(playerctl -p spotify metadata artist)
    title=$(playerctl -p spotify metadata title)
    echo '{ "text": "'" $artist => $title"'   " , "class": "custom-spotify", "alt": "Spotify"}'
    elif [ "$player_status" = "Paused" ]; then
    artist=$(playerctl -p spotify metadata artist)
    title=$(playerctl -p spotify metadata title)
    echo '{ "text": "'" $artist => $title"'   " , "class": "custom-spotify", "alt": "Spotify (Paused)"}'
    fi
    sleep 1
    done

