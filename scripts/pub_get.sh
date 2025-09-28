#!/bin/bash

# Run bootstrap for all packages or a scoped package
if [ -n "$1" ]; then
  fvm dart run melos bootstrap --scope="*$1*"
else
  fvm dart run melos bootstrap
fi