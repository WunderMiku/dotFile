#!/bin/bash

files=(".zshrc" ".vimrc")

for file in "${files[@]}"; do
    [ ! -f "$file" ] && echo "当前目录无文件：$file" && exit 1

    target="$HOME/$file"
    if [ -f "$target" ]; then
	    mv "$target" "$target.bak"
    fi
	
    ln -sfv "$PWD/$file" "$target"

done

echo "操作结束，请检查软连接是否建立"
ls -l ~/.zshrc ~/.vimrc

