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
// (android/.gitignore). Без ключа AAB для Play (bundleRelease) не собирается —
// сборка падает с понятной ошибкой, чтобы в Play не ушёл пакет с отладочной
// подписью. Тестовый APK (assembleRelease, `flutter run --release`) без ключа
// подписывается отладочным ключом — с предупреждением в логе.
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}
val hasUploadKey = keystorePropertiesFile.exists()
val requestedTasks = gradle.startParameter.taskNames
val buildsReleaseBundle = requestedTasks.any {
    it.contains("bundle", ignoreCase = true) && it.contains("release", ignoreCase = true)
}
if (buildsReleaseBundle) {
    if (!hasUploadKey) {
        throw GradleException(
            "Нет android/key.properties — AAB для Google Play с отладочной подписью собирать нельзя. " +
                "Положите ключ загрузки по инструкции в BUILD.md (раздел 2)."
        )
    }
    val missing = listOf("storeFile", "storePassword", "keyAlias", "keyPassword")
        .filter { (keystoreProperties[it] as String?).isNullOrBlank() }
    if (missing.isNotEmpty()) {
        throw GradleException("В android/key.properties не заполнено: ${missing.joinToString()}.")
    }
    val storeFilePath = keystoreProperties["storeFile"] as String
    if (!file(storeFilePath).exists()) {
        throw GradleException("Файл ключа из android/key.properties не найден: $storeFilePath")
    }
} else if (!hasUploadKey && requestedTasks.any { it.contains("release", ignoreCase = true) }) {
    logger.warn(
        "⚠️ Нет android/key.properties: релизная сборка подписана ОТЛАДОЧНЫМ ключом — " +
            "только для тестов на устройствах, в Google Play её не загрузить."
    )
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
        // Минимальная версия Android — из Flutter: с 3.44 это API 24 (Android 7.0). Этого хватает
        // androidx.core 1.18 и flutter_secure_storage 10.x (им нужно ≥ 23). Число ниже минимума
        // Flutter прописывать бесполезно — инструмент сборки переписывает его при каждой сборке.
        minSdk = flutter.minSdkVersion
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
