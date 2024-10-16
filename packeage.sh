#!/bin/sh
#出力ディレクトリ
outdir=left4dead2

rm -dr $outdir
mkdir $outdir

FILE_NAME=mods.txt
while read LINE
do
    echo $LINE
    cp -r $LINE/* $outdir
done < ${FILE_NAME}
