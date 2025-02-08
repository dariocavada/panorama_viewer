// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:example/filter-configurations/invert_filter_configuration.dart';
import 'package:example/filter-configurations/sepia_filter_configuration.dart';
import 'package:example/filter-configurations/sharpen_filter_configuration.dart';
import 'package:example/filter-configurations/vibrance_filter_configuration.dart';
import 'package:example/screens/example_screen_5.dart';
import 'package:example/screens/example_screen_7.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';

import 'screens/example_screen_1.dart';
import 'screens/example_screen_2.dart';
import 'screens/example_screen_3.dart';
import 'screens/example_screen_4.dart';
import 'screens/example_screen_6.dart';

void main() {
  // Initialize custom configurations
  FlutterImageFilters.register<SharpenFilterConfiguration>(
      () => FragmentProgram.fromAsset('shaders/sharpen.frag'));
  FlutterImageFilters.register<VibranceFilterConfiguration>(
      () => FragmentProgram.fromAsset('shaders/vibrance.frag'));
  FlutterImageFilters.register<InvertFilterConfiguration>(
      () => FragmentProgram.fromAsset('shaders/invert.frag'));
  FlutterImageFilters.register<SepiaFilterConfiguration>(
      () => FragmentProgram.fromAsset('shaders/sepia.frag'));
  runApp(const MyApp());
}

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
          ListTile(
            title: const Text('Example 5 - 2 panoramas side by side'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExampleScreen5(
                    title: '2 panoramas side by side',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Example 6 - Image Editor'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExampleScreen6(
                    title: 'Image Editor',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Example 7 - Image Filters'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExampleScreen7(
                    title: 'Image Filters',
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
