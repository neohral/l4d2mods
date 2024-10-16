#!/bin/sh
dir_path="mods/*"
dirs=`find $dir_path -maxdepth 0 -type d`
for dir in $dirs;
do
    echo $dir >> mods.txt
done
