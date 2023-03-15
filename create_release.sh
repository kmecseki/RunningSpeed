#!/bin/bash

dir=$(basename $(pwd))

ver=$1

new_dir="$dir""_$ver"
mkdir "$new_dir"

cp -r * "$new_dir"

zip -r "$new_dir"".zip" "$new_dir"

rm -rf "$new_dir"
