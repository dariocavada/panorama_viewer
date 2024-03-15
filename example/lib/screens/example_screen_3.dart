import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class ExampleScreen3 extends StatefulWidget {
  const ExampleScreen3({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  ExampleScreen2State createState() => ExampleScreen2State();
}

class ExampleScreen2State extends State<ExampleScreen3> {
  bool _showDebugInfo = false;
  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;
  int _panoId = 0;

  List<Image> panoImages = [
    Image.asset('assets/panorama1.webp'),
    Image.asset('assets/panorama2.webp'),
    Image.asset('assets/panorama3.webp'),
  ];

  void onViewChanged(longitude, latitude, tilt) {
    setState(() {
      _lon = longitude;
      _lat = latitude;
      _tilt = tilt;
    });
  }

  Widget hotspotButton(
      {String? text, IconData? icon, VoidCallback? onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.black38),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: onPressed,
          child: Icon(icon),
        ),
        text != null
            ? Container(
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text)),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget panorama;
    switch (_panoId % panoImages.length) {
      case 0:
        panorama = PanoramaViewer(
          animSpeed: .1,
          sensorControl: SensorControl.orientation,
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          onLongPressStart: (longitude, latitude, tilt) =>
              print('onLongPressStart: $longitude, $latitude, $tilt'),
          onLongPressMoveUpdate: (longitude, latitude, tilt) =>
              print('onLongPressMoveUpdate: $longitude, $latitude, $tilt'),
          onLongPressEnd: (longitude, latitude, tilt) =>
              print('onLongPressEnd: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              latitude: -15.0,
              longitude: -129.0,
              width: 90,
              height: 80,
              widget: hotspotButton(
                  text: "Next scene",
                  icon: Icons.open_in_browser,
                  onPressed: () => setState(() => _panoId = 1)),
            ),
          ],
          child: Image.asset('assets/panorama1.webp'),
        );
        break;
      case 1:
        panorama = PanoramaViewer(
          animSpeed: 0.1,
          sensorControl: SensorControl.orientation,
          onViewChanged: onViewChanged,
          /*croppedArea: const Rect.fromLTWH(2533.0, 1265.0, 5065.0, 2533.0),
          croppedFullWidth: 10132.0,
          croppedFullHeight: 5066.0,*/
          hotspots: [
            Hotspot(
              latitude: 0.0,
              longitude: -46.0,
              width: 90.0,
              height: 80.0,
              widget: hotspotButton(
                  text: "Next scene",
                  icon: Icons.double_arrow,
                  onPressed: () => setState(() {
                        _panoId = 2;
                      })),
            ),
          ],
          child: Image.asset('assets/panorama3.webp'),
        );
        break;
      default:
        panorama = PanoramaViewer(
          animSpeed: 0.1,
          sensorControl: SensorControl.orientation,
          onViewChanged: onViewChanged,
          hotspots: [
            Hotspot(
              latitude: 0.0,
              longitude: 160.0,
              width: 90.0,
              height: 80.0,
              widget: hotspotButton(
                  text: "Next scene",
                  icon: Icons.double_arrow,
                  onPressed: () => setState(() {
                        _panoId = 0;
                      })),
            ),
          ],
          child: panoImages[_panoId],
        );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Stack(
        children: [
          panorama,
          if (_showDebugInfo) // Conditionally display the Text widget
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                '${_lon.toStringAsFixed(3)}, ${_lat.toStringAsFixed(3)}, ${_tilt.toStringAsFixed(3)}',
                style: const TextStyle(
                  backgroundColor: Colors.black54, // Improve readability
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showDebugInfo = !_showDebugInfo;
          });
        },
        child: Icon(_showDebugInfo ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}
