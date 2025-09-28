#!/bin/bash

# Run build_runner based on scope argument
if [ -n "$1" ]; then
  # Scoped execution for specific packages
  fvm dart run melos exec --scope="*$1*" -- \
     'rm -rf .dart_tool && \
     fvm dart run build_runner build --delete-conflicting-outputs'
else
  # Remove .dart_tool and run build_runner for all packages
  fvm dart run melos exec --depends-on=build_runner -- \
     'rm -rf .dart_tool && \
     fvm dart run build_runner build --delete-conflicting-outputs'
fi