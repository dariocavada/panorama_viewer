import 'package:flutter/material.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class ExampleScreen6 extends StatefulWidget {
  const ExampleScreen6({super.key, required this.title});

  final String title;

  @override
  State<ExampleScreen6> createState() => _ExampleScreen6State();
}

class _ExampleScreen6State extends State<ExampleScreen6> {
  late BrightnessShaderConfiguration brightnessConfig;
  late ContrastShaderConfiguration contrastConfig;
  late SaturationShaderConfiguration saturationConfig;
  late GroupShaderConfiguration configuration;
  String? selectedFilter;

  // Default values - these represent no change to the image
  double brightness = 0.0; // 0.0 means no brightness change
  double contrast = 1.0; // 1.0 means original contrast
  double saturation = 1.0; // 1.0 means original saturation

  @override
  void initState() {
    super.initState();
    _initConfiguration();
  }

  void _initConfiguration() {
    brightnessConfig = BrightnessShaderConfiguration()..brightness = brightness;
    contrastConfig = ContrastShaderConfiguration()..contrast = contrast;
    saturationConfig = SaturationShaderConfiguration()..saturation = saturation;

    configuration = GroupShaderConfiguration();
    configuration.add(brightnessConfig);
    configuration.add(contrastConfig);
    configuration.add(saturationConfig);
  }

  void _resetAll() {
    setState(() {
      brightness = 0.0; // Reset to neutral brightness
      contrast = 1.0; // Reset to original contrast
      saturation = 1.0; // Reset to original saturation
      _initConfiguration();
    });
  }

  void _resetFilter(String filter) {
    setState(() {
      switch (filter) {
        case 'brightness':
          brightness = 0.0; // Reset to neutral brightness
          brightnessConfig.brightness = brightness;
          break;
        case 'contrast':
          contrast = 1.0; // Reset to original contrast
          contrastConfig.contrast = contrast;
          break;
        case 'saturation':
          saturation = 1.0; // Reset to original saturation
          saturationConfig.saturation = saturation;
          break;
      }
      // Force configuration update
      configuration = GroupShaderConfiguration();
      configuration.add(brightnessConfig);
      configuration.add(contrastConfig);
      configuration.add(saturationConfig);
    });
  }

  void _updateFilter(String filter, double value) {
    setState(() {
      switch (filter) {
        case 'brightness':
          brightness = value;
          brightnessConfig.brightness = value;
          break;
        case 'contrast':
          contrast = value;
          contrastConfig.contrast = value;
          break;
        case 'saturation':
          saturation = value;
          saturationConfig.saturation = value;
          break;
      }
      // Force configuration update
      configuration = GroupShaderConfiguration();
      configuration.add(brightnessConfig);
      configuration.add(contrastConfig);
      configuration.add(saturationConfig);
    });
  }

  Widget _buildFilterControl() {
    if (selectedFilter == null) return const SizedBox.shrink();

    double value;
    double min;
    double max;

    switch (selectedFilter) {
      case 'brightness':
        value = brightness;
        min = -1.0;
        max = 1.0;
        break;
      case 'contrast':
        value = contrast;
        min = 0.0;
        max = 4.0;
        break;
      case 'saturation':
        value = saturation;
        min = 0.0;
        max = 2.0;
        break;
      default:
        return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: (newValue) => _updateFilter(selectedFilter!, newValue),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _resetFilter(selectedFilter!),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetAll,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PanoramaViewer(
              filterConfiguration: configuration,
              child: Image.asset('assets/panorama1-rid.jpg'),
              onFilteredImageChanged: (filteredImage) {
                debugPrint('Filtered image: $filteredImage');
                // Here you get the filtered image whenever it changes
                // You can store it, process it further, etc.
              },
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFilterControl(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterButton(
                      label: 'Brightness',
                      isSelected: selectedFilter == 'brightness',
                      onTap: () => setState(() => selectedFilter =
                          selectedFilter == 'brightness' ? null : 'brightness'),
                    ),
                    FilterButton(
                      label: 'Contrast',
                      isSelected: selectedFilter == 'contrast',
                      onTap: () => setState(() => selectedFilter =
                          selectedFilter == 'contrast' ? null : 'contrast'),
                    ),
                    FilterButton(
                      label: 'Saturation',
                      isSelected: selectedFilter == 'saturation',
                      onTap: () => setState(() => selectedFilter =
                          selectedFilter == 'saturation' ? null : 'saturation'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Theme.of(context).primaryColor
            : Theme.of(context).primaryColor.withValues(alpha: 0.3),
      ),
      onPressed: onTap,
      child: Text(label),
    );
  }
}
