#!/bin/bash


fvm flutter clean
fvm flutter pub get

fvm dart run import_sorter:main
fvm dart run build_runner build --delete-conflicting-outputs
sh scripts/generate/generate_assets.sh
sh scripts/generate/generate_localization.sh
sh scripts/generate/generate_modules.sh