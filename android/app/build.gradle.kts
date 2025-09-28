import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}
val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.inputStream().use { stream ->
        localProperties.load(stream)
    }
}

val flutterVersionCode = localProperties.getProperty("flutter.versionCode") ?: "1"
val flutterVersionName = localProperties.getProperty("flutter.versionName") ?: "1.0"

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.weather.app"
    compileSdk = 36
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    sourceSets["main"].java.srcDirs("src/main/kotlin")

    defaultConfig {
        applicationId = "com.weather.app"
        minSdk = flutter.minSdkVersion
        targetSdk = 36
        versionCode = flutterVersionCode.toString().toInt()
        versionName = flutterVersionName.toString()
        multiDexEnabled = true
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"]?.toString()
            keyPassword = keystoreProperties["keyPassword"]?.toString()
            storeFile = file(keystoreProperties["storeFile"]?.toString())
            storePassword = keystoreProperties["storePassword"]?.toString()
        }
    }

    buildTypes {
        getByName("debug") {
        }
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
        }
    }

    flavorDimensions += "app"
    productFlavors {
        create("dev") {
            dimension = "app"
            resValue(
                type = "string",
                name = "app_name",
                value = "Weather App [Dev]")
            applicationIdSuffix = ".dev"
        }
        create("prod") {
            dimension = "app"
            resValue(
                type = "string",
                name = "app_name",
                value = "Weather App")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")

    implementation("com.google.android.gms:play-services-basement:18.6.0")
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.9.20")

    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("androidx.core:core-ktx:1.13.1")

    implementation("com.android.support:multidex:1.0.3")
    implementation("com.google.android.gms:play-services-vision:20.1.3")
}
