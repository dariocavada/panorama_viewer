# Panorama Viewer

A 360-degree panorama viewer.

This package is an updated porting of the plugin https://github.com/zesage/panorama.

## Getting Started

Add panorama as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  panorama_viewer: ^2.0.1
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

## Image Filters

To apply image filters to the panorama image, use the package `flutter_image_filters`.
For more information about the package, check out the [flutter_image_filters](https://github.com/zesage/flutter_image_filters) repository.

### Installation

Add the package to your pubspec.yaml file.
```yaml
dependencies:
  flutter_image_filters: ^0.1.0
```

### Example 6

Check out the example 6 in the example folder to see how to create an image editor with image filters.

### Example 7

Check out the example 7 in the example folder to see how to apply image filters to the panorama image.



## Migration from the Panorama package

- In the dependencies, use `panorama_viewer` instead of `panorama`.
- In the Dart files where you use panorama, change the import to: `import 'package:panorama_viewer/panorama_viewer.dart';`.
- Change the widget name from `Panorama` to `PanoramaViewer`.
- If you've used `SensorControl`, change `SensorControl.Orientation` to `SensorControl.orientation`. All constant names are now in lower camel case, following the latest Dart best practices.

## Web implementation

On the web, sensors are not utilized because the sensor library used is only compatible with iOS and Android devices. Additionally, on some Android devices, if the panoramic image is too large, nothing is displayed. When checking the console log remotely, you may encounter WebGL errors or warnings.




