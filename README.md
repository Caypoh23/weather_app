# Weather App

A Flutter weather application built with a modular architecture.

## Prerequisites

Before running this project, ensure you have the following installed:

- **Flutter SDK**: Version 3.35.4 (required)
- **Dart SDK**: Version >=3.8.1 <4.0.0
- **FVM (Flutter Version Management)**: For managing Flutter versions

## Project Setup

### 1. Install FVM (Flutter Version Management)

If you don't have FVM installed, install it globally:

```bash
dart pub global activate fvm
```

### 2. Install Required Flutter Version

Install the specific Flutter version required by this project:

```bash
fvm install 3.35.4
```

### 3. Install Project Dependencies

Run the installation script to set up all required tools:

```bash
# Install FVM and Flutter version
sh scripts/install/fvm_install.sh

# Install Melos for monorepo management
sh scripts/install/melos_install.sh

# Install Slang for localization
sh scripts/install/slang_install.sh
```

### 4. Bootstrap the Project

Use Melos to bootstrap all packages and dependencies:

```bash
# Bootstrap all packages
sh scripts/pub_get.sh

# Or bootstrap specific packages
sh scripts/pub_get.sh weather
```

### 5. Generate Code and Assets

Run the code generation script to generate all necessary files:

```bash
sh scripts/generate/generate_all.sh
```

This script will:
- Clean the project
- Get dependencies
- Sort imports
- Run build_runner for code generation
- Generate assets
- Generate localization files
- Generate modules

### 6. Generate Additional Assets (Optional)

If you need to regenerate assets or localization:

```bash
# Generate assets
sh scripts/generate/generate_assets.sh

# Generate localization files
sh scripts/generate/generate_localization.sh
```

## Running the Project

### Development Mode

```bash
# Run in debug mode
fvm flutter run

# Run on specific device
fvm flutter run -d <device_id>

# Run with hot reload enabled
fvm flutter run --hot
```

### Release Mode

```bash
# Build and run in release mode
fvm flutter run --release
```

### Platform-Specific Commands

#### Android

```bash
# Build APK
fvm flutter build apk

# Build App Bundle
fvm flutter build appbundle

# Run on Android device/emulator
fvm flutter run -d android
```

#### iOS

```bash
# Build iOS app
fvm flutter build ios

# Run on iOS device/simulator
fvm flutter run -d ios
```

## Project Structure

This project uses a modular architecture with the following structure:

```
weather_app/
├── lib/                    # Main application code
├── modules/               # Feature modules
│   ├── authorization/     # Authentication module
│   ├── city_search/       # City search functionality
│   ├── core/             # Core utilities and services
│   └── weather/          # Weather data and UI
├── packages/             # Shared packages
│   ├── localization/     # Internationalization
│   └── uikit/           # UI components and themes
└── scripts/             # Build and utility scripts
```

## Available Scripts

- `scripts/install/fvm_install.sh` - Install FVM and Flutter version
- `scripts/install/melos_install.sh` - Install Melos
- `scripts/install/slang_install.sh` - Install Slang
- `scripts/generate/generate_all.sh` - Generate all code and assets
- `scripts/generate/generate_assets.sh` - Generate asset files
- `scripts/generate/generate_localization.sh` - Generate localization files
- `scripts/generate/generate_modules.sh` - Generate module-specific code
- `scripts/pub_get.sh` - Bootstrap packages with Melos

## Troubleshooting

### Common Issues

1. **Flutter version mismatch**: Ensure you're using Flutter 3.35.4 via FVM
2. **Dependencies not found**: Run `sh scripts/pub_get.sh` to bootstrap packages
3. **Code generation errors**: Run `sh scripts/generate/generate_all.sh`
4. **Build errors**: Clean and rebuild with `fvm flutter clean && fvm flutter pub get`

### Clean Build

If you encounter persistent issues, perform a clean build:

```bash
fvm flutter clean
sh scripts/pub_get.sh
sh scripts/generate/generate_all.sh
fvm flutter run
```

## Development Workflow

1. Make changes to your code
2. Run `sh scripts/generate/generate_all.sh` if you modified models or added new features
3. Test your changes with `fvm flutter run`
4. Use hot reload for faster development iterations

## Contributing

When contributing to this project:

1. Ensure all code generation scripts pass
2. Run `fvm dart run import_sorter:main` to format imports
3. Test on both Android and iOS platforms
4. Follow the existing code structure and patterns
