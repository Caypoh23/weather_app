#!/bin/bash

echo "🚀 Starting iOS Prod IPA build process..."

# Define the project root directory
PROJECT_ROOT_DIR=$(echo "$(pwd)" | sed 's|/scripts.*||')
echo "📁 Project root directory: $PROJECT_ROOT_DIR"
cd $PROJECT_ROOT_DIR

# Clean and get the dependencies
echo "🧹 Cleaning Flutter project..."
fvm flutter clean
echo "📦 Getting Flutter dependencies..."
fvm flutter pub get

# Install pods
echo "🍎 Installing iOS pods..."
cd $PROJECT_ROOT_DIR/ios
pod install
echo "🔄 Updating iOS pods..."
pod update
cd $PROJECT_ROOT_DIR

# Generate all the files
echo "⚙️ Generating all files..."
cd $PROJECT_ROOT_DIR/scripts/generate
bash generate_all.sh
cd $PROJECT_ROOT_DIR

# Build the ipa prod
echo "🔨 Building iOS Prod IPA..."
fvm flutter build ipa --release --flavor=prod -t lib/main/main_prod.dart --dart-define-from-file=.env

echo "✅ iOS Prod IPA build completed!"