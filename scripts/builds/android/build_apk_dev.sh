#!/bin/bash

echo "🚀 Starting Android Dev APK build process..."

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

# Build the apk dev
echo "🔨 Building Android Dev APK..."
fvm flutter build apk --release --flavor=dev -t lib/main/main_dev.dart --dart-define-from-file=.env

echo "✅ Android Dev APK build completed!"