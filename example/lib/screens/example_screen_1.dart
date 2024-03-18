import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class ExampleScreen1 extends StatefulWidget {
  const ExampleScreen1({super.key, required this.title});
  final String title;
  @override
  ExampleScreen1State createState() => ExampleScreen1State();
}

class ExampleScreen1State extends State<ExampleScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PanoramaViewer(
        animSpeed: .1,
        sensorControl: SensorControl.orientation,
        child: Image.asset('assets/panorama1.webp'),
      ),
    );
  }
}
