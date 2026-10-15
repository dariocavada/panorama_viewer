## 3.0.0

### Breaking changes

* Require Flutter 3.47 or newer and Dart 3.13 or newer (previously Flutter 3.3 / Dart 3.5.3 in this package).
* Upgrade `dchs_motion_sensors` from `^2.0.1` to `^3.0.0`, which requires `vector_math ^2.4.3`.
* Android apps using AGP 8 or opting out of AGP 9 built-in Kotlin must provide Kotlin Gradle Plugin 2.2.20 or newer. Kotlin 1.8 hosts are no longer supported.
* Existing iOS apps must account for the sensor plugin's Swift-only registration and Swift Package Manager support, introduced in 2.0.2. The plugin requires iOS 13; the updated example uses Flutter 3.47's iOS deployment target of 15.

### Updates

* Keep the existing `PanoramaViewer`, `PanoramaController` and `SensorControl` Dart APIs; no application Dart changes are required for this upgrade.
* Update the example to AGP 9.1.1 / Gradle 9.3.1 with built-in Kotlin, Kotlin 2.4.20 on the plugin classpath, Java / Kotlin target 17 and the legacy Android DSL required by Flutter 3.47.
* Migrate the example's iOS host to Swift Package Manager integration, the UIScene lifecycle and iOS 15.
* Align package and example SDK constraints and update `flutter_lints` to 6.0.0.
* Add explicit callback parameter types in the hotspot example to satisfy the updated lints.
* Inherit the sensor plugin's AGP 9 compatibility fix and native replies for sensor interval changes.

## 2.0.7
* Fixed black screen issue introduced in v2.0.6.  
* Corrected scene initialization check (`surface == null`) to restore compatibility.

## 2.0.6
* Minor format updates

## 2.0.5
* Minor updates to the code
* Merge #PR22 thank you to @StefanosKouzounis
    * Updated the description in pubspec.yaml to fix Failed report section
    * Follow Dart file conventions in pub.dev
    * Implemented null-aware operators and added null checks to prevent potential runtime crashes.

## 2.0.4 
* Merge #PR19, #PR20. Use of controller instead of flags thank you to @Henk-Keijzer
* Minor updates to the code

## 2.0.3
* update dchs_motion_sensors to 2.0.1 for latest version of Flutter (3.29.0)

## 2.0.2
* Reintroduced sensor controls for iOS and Android.

## 2.0.1
* Added initial web support without sensors (since dchs_motion_sensors is not implemented for the web).
* Works well on macOS, Windows, and iOS. However, on some Android devices, WebGL errors may occur if the panorama image is too large.

## 2.0.0
* update dchs-motion sensor to 2.0.0
* update sdk environment to 3.5.*
* update flutter_lints to 5.0.0
* change build gradle for recommended plugin usage
* update gradle to 8.3

## 1.0.6
* Fixed an issue where re-rendering the Panorama resulted in a blank screen. Thanks to @ewanAtPropertyMe for the fix.

## 1.0.5
* updated dchs_motion_sensors to 1.1.0
* updated examples

## 1.0.4
* updates to make the movement smooth thank you to @Henk-Keijzer 
* added setAnimSpeed(double newSpeed) thank you to @Henk-Keijzer 

## 1.0.3
* separate examples. simple, simple with transparent app bar, full, and one with external controls
* added two new methods to control zoom and position with external buttons and slided. Added also an example on how to use
* solve the Longitude and latitude initialization #2 (porting from PRs in original repo)


## 1.0.2

* bug fixing for iOS, updated dependencies (dchs_motion_sensors 1.0.2) 

## 1.0.1

* initial release from https://github.com/zesage/panorama
