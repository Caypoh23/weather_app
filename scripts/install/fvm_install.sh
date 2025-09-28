#!/bin/bash

PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

cd $PROJECT_ROOT_DIR
fvm dart pub global activate fvm 3.2.1

echo "-- run fvm --version"
fvm --version

echo "-- run fvm install"
fvm install