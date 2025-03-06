import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class ExampleScreen4 extends StatefulWidget {
  const ExampleScreen4({super.key, required this.title});
  final String title;
  @override
  ExampleScreen4State createState() => ExampleScreen4State();
}

class ExampleScreen4State extends State<ExampleScreen4> {
  PanoramaController panoramaController = PanoramaController();
  double _latitudeDegrees = 0; // Slider value in degrees
  double _longitudeDegrees = 0; // Slider value in degrees

  void _zoomIn() {
    panoramaController.setZoom(panoramaController.getZoom() + 0.5);
  }

  void _zoomOut() {
    panoramaController.setZoom(panoramaController.getZoom() - 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          PanoramaViewer(
            animSpeed: .1,
            sensorControl: SensorControl.orientation,
            panoramaController: panoramaController,
            child: Image.asset('assets/panorama1.webp'),
          ),
          Positioned(
            right: 10,
            top: 100,
            child: RotatedBox(
              quarterTurns: 3,
              child: Slider(
                min: -180,
                max: 180,
                value: _latitudeDegrees,
                onChanged: (value) {
                  setState(() {
                    _latitudeDegrees = value;
                  });
                  panoramaController.setView(
                    _latitudeDegrees,
                    _longitudeDegrees,
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 100,
            child: Slider(
              min: -90,
              max: 90,
              value: _longitudeDegrees,
              onChanged: (value) {
                setState(() {
                  _longitudeDegrees = value;
                });
                panoramaController.setView(
                  _latitudeDegrees,
                  _longitudeDegrees,
                );
              },
            ),
          ),
          Positioned(
            bottom: 50,
            right: 10,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoomInBtn",
                  onPressed: _zoomIn,
                  tooltip: 'Zoom In',
                  child: const Icon(Icons.zoom_in),
                ),
                const SizedBox(height: 10), // Space between buttons
                FloatingActionButton(
                  heroTag: "zoomOutBtn",
                  onPressed: _zoomOut,
                  tooltip: 'Zoom Out',
                  child: const Icon(Icons.zoom_out),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
