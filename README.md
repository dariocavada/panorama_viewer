# Panorama Viewer

A 360-degree panorama viewer.

This package is an updated porting of the plugin https://github.com/zesage/panorama.

## Getting Started

Add panorama as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  panorama_viewer: ^1.0.2
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

## Migration from the Panorama package

- In the dependencies, use `panorama_viewer` instead of `panorama`.
- In the Dart files where you use panorama, change the import to: `import 'package:panorama_viewer/panorama_viewer.dart';`.
- Change the widget name from `Panorama` to `PanoramaViewer`.
- If you've used `SensorControl`, change `SensorControl.Orientation` to `SensorControl.orientation`. All constant names are now in lower camel case, following the latest Dart best practices.







