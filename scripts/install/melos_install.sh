#!/bin/bash

PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')

cd $PROJECT_ROOT_DIR
fvm dart pub global activate melos