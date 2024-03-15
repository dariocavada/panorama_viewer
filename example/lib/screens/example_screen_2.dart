import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class ExampleScreen2 extends StatefulWidget {
  const ExampleScreen2({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  ExampleScreen2State createState() => ExampleScreen2State();
}

class ExampleScreen2State extends State<ExampleScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(widget.title),
      ),
      body: PanoramaViewer(
        animSpeed: .1,
        sensorControl: SensorControl.orientation,
        child: Image.asset('assets/panorama2.webp'),
      ),
    );
  }
}
