#!/bin/bash

echo "🚀 Starting Android Prod APK build process..."

# Define the project root directory
PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')
echo "📁 Project root directory: $PROJECT_ROOT_DIR"
cd $PROJECT_ROOT_DIR

# Clean and get the dependencies
echo "🧹 Cleaning Flutter project..."
fvm flutter clean
echo "📦 Getting Flutter dependencies..."
fvm flutter pub get

# Generate all the files
echo "⚙️ Generating all files..."
cd $PROJECT_ROOT_DIR/scripts/generate
bash generate_all.sh
cd $PROJECT_ROOT_DIR

# Build the apk prod
echo "🔨 Building Android Prod APK..."
fvm flutter build apk --release --flavor=prod -t lib/main/main_prod.dart --dart-define-from-file=.env

echo "✅ Android Prod APK build completed!"