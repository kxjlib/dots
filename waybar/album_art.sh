#!/bin/bash
rm "/tmp/cover.jpeg"
album_art=$(playerctl -p cider2 metadata mpris:artUrl)
playing=$(playerctl -p cider2 status)
if [[ -z $album_art ]] 
then
   # spotify is dead, we should die too.
   exit
fi
if [[ "$playing" = "Playing" ]]
then
   curl -s  "${album_art}" --output "/tmp/cover.jpeg"
   echo "/tmp/cover.jpeg"
fi
