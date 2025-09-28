#!/bin/bash

for dir in modules/*;
  do
    echo "$dir"
    cd "$dir" || return
    fvm dart run build_runner build --delete-conflicting-outputs
    fvm dart run import_sorter:main
    cd ../..
  done
