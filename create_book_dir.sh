#!/bin/bash

# 引数が0個なら exit
if [ $# -eq 0 ]; then
    echo "引数を1つ指定してください"
    exit 1
fi

title=$1

# 第1引数が空文字列なら exit
if [ -z $title ]; then
    echo "第1引数が空文字列です"
    exit 1
fi

# 既に存在するタイトルを指定された場合は exit
if [ -d $title ]; then
    echo "そのタイトルは既に存在します"
    exit 1
fi

mkdir -p $title
touch "$title/README.md"
mkdir -p "$title/notes"
touch "$title/notes/.keep"
mkdir -p "$title/codes"
touch "$title/codes/.keep"
