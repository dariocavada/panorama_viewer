import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class ExampleScreen5 extends StatefulWidget {
  const ExampleScreen5({super.key, required this.title});
  final String title;
  @override
  ExampleScreen5State createState() => ExampleScreen5State();
}

class ExampleScreen5State extends State<ExampleScreen5> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    var panoAKey = GlobalKey();
    var panoBKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          SizedBox(
            width: screenWidth / 2,
            height: screenHeight,
            child: PanoramaViewer(
              key: panoAKey,
              child: Image.asset('assets/panorama1.webp'),
            ),
          ),
          SizedBox(
            width: screenWidth / 2,
            height: screenHeight,
            child: PanoramaViewer(
              key: panoBKey,
              child: Image.asset('assets/panorama2.webp'),
            ),
          ),
        ],
      ),
    );
  }
}
