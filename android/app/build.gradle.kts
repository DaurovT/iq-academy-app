import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    // Firebase (пуш-уведомления) — читает google-services.json
    id("com.google.gms.google-services")
}

// Ключ загрузки для Google Play. key.properties и сам ключ в git не попадают
// (android/.gitignore); без файла релиз подписывается отладочным ключом — такую
// сборку Play не примет, но локальный `flutter run --release` работает.
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "uz.iqacademy.platform_app"
    // Плагины (androidx.core 1.18) требуют compileSdk 36. android-36 установлен.
    compileSdk = 36
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // flutter_local_notifications (показ пушей при открытом приложении) требует
        // core library desugaring — иначе сборка падает на checkDebugAarMetadata.
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "uz.iqacademy.platform_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        // androidx.core 1.18 и flutter_secure_storage 10.x требуют minSdk >= 23 (Android 6.0).
        // flutter.minSdkVersion отдаёт 21 → манифест-мержер падает. Фиксируем явно.
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String?
            keyPassword = keystoreProperties["keyPassword"] as String?
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String?
        }
    }

    buildTypes {
        release {
            signingConfig = if (keystorePropertiesFile.exists())
                signingConfigs.getByName("release")
            else
                signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    // Библиотека десугаринга — нужна для isCoreLibraryDesugaringEnabled выше.
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

flutter {
    source = "../.."
}
