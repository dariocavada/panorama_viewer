import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class ExampleScreen4 extends StatefulWidget {
  const ExampleScreen4({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  ExampleScreen4State createState() => ExampleScreen4State();
}

class ExampleScreen4State extends State<ExampleScreen4> {
  final GlobalKey<PanoramaState> _panoramaKey = GlobalKey();
  double _latitudeDegrees = 0; // Slider value in degrees
  double _longitudeDegrees = 0; // Slider value in degrees

  void _zoomIn() {
    final currentState = _panoramaKey.currentState;
    if (currentState != null) {
      double currentZoom = currentState.scene!.camera.zoom;
      currentState.setZoom(currentZoom + 0.5); // Adjust the zoom step as needed
    }
  }

  void _zoomOut() {
    final currentState = _panoramaKey.currentState;
    if (currentState != null) {
      double currentZoom = currentState.scene!.camera.zoom;
      currentState.setZoom(currentZoom - 0.5); // Adjust the zoom step as needed
    }
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
            key: _panoramaKey,
            animSpeed: .1,
            sensorControl: SensorControl.orientation,
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
                  // Convert degrees to radians before updating
                  _panoramaKey.currentState?.setView(
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
                // Convert degrees to radians before updating
                _panoramaKey.currentState?.setView(
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
                  child: Icon(Icons.zoom_in),
                ),
                SizedBox(height: 10), // Space between buttons
                FloatingActionButton(
                  heroTag: "zoomOutBtn",
                  onPressed: _zoomOut,
                  tooltip: 'Zoom Out',
                  child: Icon(Icons.zoom_out),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
