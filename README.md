# Panorama Viewer

A 360-degree panorama viewer.

This package is an updated porting of the plugin https://github.com/zesage/panorama.

## Getting Started

Add panorama as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  panorama_viewer: ^3.0.0
```

Import and add the Panorama Viewer widget to your project.

```dart
import 'package:panorama_viewer/panorama_viewer.dart';
... ...
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PanoramaViewer(
          child: Image.asset('assets/panorama360.jpg'),
        ),
      ),
    );
  }
```

## Migration from panorama_viewer 2.x to 3.0.0

Version 3.0.0 uses [`dchs_motion_sensors ^3.0.0`](https://pub.dev/packages/dchs_motion_sensors/versions/3.0.0).
The `PanoramaViewer`, `PanoramaController` and `SensorControl` Dart APIs are unchanged.

* **Flutter / Dart:** upgrade to Flutter 3.47 or newer and Dart 3.13 or newer. Update your app's `environment` constraints before running `flutter pub get`.
* **Android:** Kotlin 1.8 is no longer supported by the sensor plugin. Apps using AGP 8, or AGP 9 with built-in Kotlin disabled, must provide Kotlin Gradle Plugin 2.2.20 or newer with a compatible AGP / Gradle toolchain. The example uses AGP 9.1.1 and Gradle 9.3.1 with built-in Kotlin, `android.builtInKotlin=true`, `android.newDsl=false`, and Java / Kotlin target 17. Remove the separate `kotlin-android` plugin when using built-in Kotlin and configure targets through `kotlin.compilerOptions`. Use JDK 17 or newer to run Gradle.
* **iOS:** the dependency now uses Swift-only registration and supports Swift Package Manager. The sensor plugin declares iOS 13 as its minimum; this example targets iOS 15 with Flutter 3.47. For an older host, back up custom native changes and regenerate its Flutter integration with `flutter create --platforms=ios .`, then review the diff and rebuild. Do not lower a higher deployment target already required by Flutter or another plugin.
* **Dependency constraints:** remove old `dchs_motion_sensors` / `vector_math` overrides or pins that conflict with `dchs_motion_sensors ^3.0.0` and `vector_math ^2.4.3`.

See the [sensor plugin changelog](https://pub.dev/packages/dchs_motion_sensors/versions/3.0.0/changelog) for the upstream changes. Sensor control remains available on Android and iOS only.

The Android example declares `org.jetbrains.kotlin.android` version `2.4.20` with `apply false` in `settings.gradle` to align the compiler classpath with Flutter's requirements. It does not apply that plugin to the app when built-in Kotlin is enabled.

## Migration from the Panorama package

- In the dependencies, use `panorama_viewer` instead of `panorama`.
- In the Dart files where you use panorama, change the import to: `import 'package:panorama_viewer/panorama_viewer.dart';`.
- Change the widget name from `Panorama` to `PanoramaViewer`.
- If you've used `SensorControl`, change `SensorControl.Orientation` to `SensorControl.orientation`. All constant names are now in lower camel case, following the latest Dart best practices.

## Web implementation

On the web, sensors are not utilized because the sensor library used is only compatible with iOS and Android devices. Additionally, on some Android devices, if the panoramic image is too large, nothing is displayed. When checking the console log remotely, you may encounter WebGL errors or warnings.




