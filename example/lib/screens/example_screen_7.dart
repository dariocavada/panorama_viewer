import 'package:flutter/material.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class ExampleScreen7 extends StatefulWidget {
  const ExampleScreen7({super.key, required this.title});
  final String title;
  @override
  ExampleScreen7State createState() => ExampleScreen7State();
}

class ExampleScreen7State extends State<ExampleScreen7> {
  late GroupShaderConfiguration configuration;
  late ContrastShaderConfiguration contrastConfig;

  @override
  void initState() {
    super.initState();

    contrastConfig = ContrastShaderConfiguration()..contrast = 1.2;
    configuration = GroupShaderConfiguration();
    configuration.add(contrastConfig);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PanoramaViewer(
        animSpeed: .1,
        filterConfiguration: configuration,
        //sensorControl: SensorControl.orientation,
        //child: Image.asset('assets/panorama1.webp'),
        child: Image.asset('assets/panorama1-rid.jpg'),
      ),
    );
  }
}
