// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'screens/example_screen_1.dart';
import 'screens/example_screen_2.dart';
import 'screens/example_screen_3.dart';
import 'screens/example_screen_4.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Panorama',
      theme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Panorama Viewer'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Example 1 - minimum code'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExampleScreen1(
                    title: 'Minimum code',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Example 2 - transparent appbar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExampleScreen2(
                    title: 'Transparent appbar',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Example 3 - with hotspots and callbacks'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExampleScreen3(
                    title: 'Hotspots and callbacks',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Example 4 - Zoom and position with buttons'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExampleScreen4(
                    title: 'Zoom and position with buttons',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
