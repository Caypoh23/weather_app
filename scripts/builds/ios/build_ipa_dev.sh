#!/bin/bash

echo "🚀 Starting iOS Dev IPA build process..."

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

# Build the ipa dev
echo "🔨 Building iOS Dev IPA..."
fvm flutter build ipa --release --flavor=dev -t lib/main_dev.dart --dart-define-from-file=.env

echo "✅ iOS Dev IPA build completed!"