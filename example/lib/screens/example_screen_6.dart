import 'package:example/filter-configurations/invert_filter_configuration.dart';
import 'package:example/filter-configurations/sepia_filter_configuration.dart';
import 'package:example/filter-configurations/sharpen_filter_configuration.dart';
import 'package:example/filter-configurations/vibrance_filter_configuration.dart';
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
  late HueShaderConfiguration hueConfig;
  late ExposureShaderConfiguration exposureConfig;
  late ColorInvertShaderConfiguration colorInvertConfig;
  late GammaShaderConfiguration gammaConfig;
  late GroupShaderConfiguration configuration;
  late SharpenFilterConfiguration sharpenConfig;
  late VibranceFilterConfiguration vibranceConfig;
  late InvertFilterConfiguration invertConfig;
  late SepiaFilterConfiguration sepiaConfig;
  String? selectedFilter;

  // Default values - these represent no change to the image
  double brightness = 0.0; // 0.0 means no brightness change
  double contrast = 1.0; // 1.0 means original contrast
  double saturation = 1.0; // 1.0 means original saturation
  double hue = 0.0; // 0.0 means no hue change
  double exposure = 0.0; // 0.0 means no exposure change
  double gamma = 1.0; // 1.0 means no gamma change
  double sharpen = 0; // 0.0 means no sharpen change
  double vibrance = 0; // 0.0 means no vibrance change
  double invert = 0; // 0.0 means no invert change
  double sepia = 0; // 0.0 means no sepia change
  @override
  void initState() {
    super.initState();
    _initConfiguration();
  }

  void _initConfiguration() {
    brightnessConfig = BrightnessShaderConfiguration()..brightness = brightness;
    contrastConfig = ContrastShaderConfiguration()..contrast = contrast;
    saturationConfig = SaturationShaderConfiguration()..saturation = saturation;
    hueConfig = HueShaderConfiguration()..hueAdjust = hue;
    exposureConfig = ExposureShaderConfiguration()..exposure = exposure;
    gammaConfig = GammaShaderConfiguration()..gamma = gamma;
    sharpenConfig = SharpenFilterConfiguration()..sharpen = sharpen;
    vibranceConfig = VibranceFilterConfiguration()..vibrance = vibrance;
    invertConfig = InvertFilterConfiguration()..invert = invert;
    sepiaConfig = SepiaFilterConfiguration()..sepia = sepia;
    configuration = GroupShaderConfiguration();
    configuration.add(brightnessConfig);
    configuration.add(contrastConfig);
    configuration.add(saturationConfig);
    configuration.add(hueConfig);
    configuration.add(exposureConfig);
    configuration.add(gammaConfig);
    configuration.add(sharpenConfig);
    configuration.add(vibranceConfig);
    configuration.add(invertConfig);
    configuration.add(sepiaConfig);
  }

  void _resetAll() {
    setState(() {
      brightness = 0.0; // Reset to neutral brightness
      contrast = 1.0; // Reset to original contrast
      saturation = 1.0; // Reset to original saturation
      hue = 0.0; // Reset to original hue
      exposure = 0.0; // Reset to original exposure
      gamma = 1.0; // Reset to original gamma
      sharpen = 0.0; // Reset to original sharpen
      vibrance = 0.0; // Reset to original vibrance
      invert = 0.0; // Reset to original invert
      sepia = 0.0; // Reset to original sepia
      _initConfiguration();
    });
  }

  void _resetFilter(String filter) {
    setState(() {
      switch (filter) {
        case 'sharpen':
          sharpen = 0; // Reset to neutral sharpen
          sharpenConfig.sharpen = sharpen;
          break;
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
        case 'hue':
          hue = 0.0; // Reset to original hue
          hueConfig.hueAdjust = hue;
          break;
        case 'exposure':
          exposure = 0.0; // Reset to original exposure
          exposureConfig.exposure = exposure;
          break;
        case 'gamma':
          gamma = 1.0; // Reset to original gamma
          gammaConfig.gamma = gamma;
          break;
        case 'vibrance':
          vibrance = 0; // Reset to neutral vibrance
          vibranceConfig.vibrance = vibrance;
          break;
        case 'invert':
          invert = 0; // Reset to neutral invert
          invertConfig.invert = invert;
          break;
        case 'sepia':
          sepia = 0; // Reset to neutral sepia
          sepiaConfig.sepia = sepia;
      }
      // Force configuration update
      configuration = GroupShaderConfiguration();
      configuration.add(brightnessConfig);
      configuration.add(contrastConfig);
      configuration.add(saturationConfig);
      configuration.add(hueConfig);
      configuration.add(exposureConfig);
      configuration.add(gammaConfig);
      configuration.add(sharpenConfig);
      configuration.add(vibranceConfig);
      configuration.add(invertConfig);
      configuration.add(sepiaConfig);
    });
  }

  void _updateFilter(String filter, double value) {
    setState(() {
      switch (filter) {
        case 'sharpen':
          sharpen = value;
          sharpenConfig.sharpen = value;
          break;
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
        case 'hue':
          hue = value;
          hueConfig.hueAdjust = value;
          break;
        case 'exposure':
          exposure = value;
          exposureConfig.exposure = value;
          break;
        case 'gamma':
          gamma = value;
          gammaConfig.gamma = value;
          break;
        case 'vibrance':
          vibrance = value;
          vibranceConfig.vibrance = value;
          break;
        case 'invert':
          invert = value;
          invertConfig.invert = value;
          break;
        case 'sepia':
          sepia = value;
          sepiaConfig.sepia = value;
          break;
      }

      debugPrint('filter: $filter');
      debugPrint('value: $value');
      // Force configuration update
      configuration = GroupShaderConfiguration();
      configuration.add(sharpenConfig);
      configuration.add(brightnessConfig);
      configuration.add(contrastConfig);
      configuration.add(saturationConfig);
      configuration.add(hueConfig);
      configuration.add(exposureConfig);
      configuration.add(gammaConfig);
      configuration.add(vibranceConfig);
      configuration.add(invertConfig);
      configuration.add(sepiaConfig);
    });
  }

  Widget _buildFilterControl() {
    if (selectedFilter == null) return const SizedBox.shrink();

    double value;
    double min;
    double max;

    switch (selectedFilter) {
      case 'sharpen':
        value = sharpen;
        min = 0;
        max = 5.0;
        break;
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
      case 'hue':
        value = hue;
        min = 0;
        max = 360;
        break;
      case 'exposure':
        value = exposure;
        min = -10;
        max = 10;
        break;
      case 'gamma':
        value = gamma;
        min = 0.0;
        max = 3.0;
        break;
      case 'vibrance':
        value = vibrance;
        min = 0.0;
        max = 1.0;
        break;
      case 'invert':
        value = invert;
        min = 0.0;
        max = 1.0;
        break;
      case 'sepia':
        value = sepia;
        min = 0.0;
        max = 1.0;
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
      body: SafeArea(
        child: Stack(
          children: [
            // Panorama takes full screen
            PanoramaViewer(
              filterConfiguration: configuration,
              child: Image.asset('assets/panorama1-rid.jpg'),
              onFilteredImageChanged: (filteredImage) {
                debugPrint('Filtered image: $filteredImage');
              },
            ),

            // Controls overlay at bottom
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withValues(alpha: 0.9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Slider appears above buttons when filter selected
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: selectedFilter != null ? 50 : 0,
                      child: SingleChildScrollView(
                        child: _buildFilterControl(),
                      ),
                    ),

                    // Scrollable buttons row
                    SizedBox(
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        physics: const BouncingScrollPhysics(),
                        children: [
                          FilterButton(
                            label: 'Sharpen',
                            isSelected: selectedFilter == 'sharpen',
                            onTap: () => setState(() => selectedFilter =
                                selectedFilter == 'sharpen' ? null : 'sharpen'),
                          ),
                          const SizedBox(width: 8),
                          FilterButton(
                            label: 'Brightness',
                            isSelected: selectedFilter == 'brightness',
                            onTap: () => setState(() => selectedFilter =
                                selectedFilter == 'brightness'
                                    ? null
                                    : 'brightness'),
                          ),
                          const SizedBox(width: 8),
                          FilterButton(
                            label: 'Contrast',
                            isSelected: selectedFilter == 'contrast',
                            onTap: () => setState(() => selectedFilter =
                                selectedFilter == 'contrast'
                                    ? null
                                    : 'contrast'),
                          ),
                          const SizedBox(width: 8),
                          FilterButton(
                            label: 'Saturation',
                            isSelected: selectedFilter == 'saturation',
                            onTap: () => setState(() => selectedFilter =
                                selectedFilter == 'saturation'
                                    ? null
                                    : 'saturation'),
                          ),
                          const SizedBox(width: 8),
                          FilterButton(
                            label: 'Hue',
                            isSelected: selectedFilter == 'hue',
                            onTap: () => setState(() => selectedFilter =
                                selectedFilter == 'hue' ? null : 'hue'),
                          ),
                          const SizedBox(width: 8),
                          FilterButton(
                            label: 'Exposure',
                            isSelected: selectedFilter == 'exposure',
                            onTap: () => setState(() => selectedFilter =
                                selectedFilter == 'exposure'
                                    ? null
                                    : 'exposure'),
                          ),
                          const SizedBox(width: 8),
                          FilterButton(
                            label: 'Gamma',
                            isSelected: selectedFilter == 'gamma',
                            onTap: () => setState(() => selectedFilter =
                                selectedFilter == 'gamma' ? null : 'gamma'),
                          ),
                          const SizedBox(width: 8),
                          FilterButton(
                            label: 'Vibrance',
                            isSelected: selectedFilter == 'vibrance',
                            onTap: () => setState(() => selectedFilter =
                                selectedFilter == 'vibrance'
                                    ? null
                                    : 'vibrance'),
                          ),
                          const SizedBox(width: 8),
                          FilterButton(
                            label: 'Invert',
                            isSelected: selectedFilter == 'invert',
                            onTap: () => setState(() => selectedFilter =
                                selectedFilter == 'invert' ? null : 'invert'),
                          ),
                          const SizedBox(width: 8),
                          FilterButton(
                            label: 'Sepia',
                            isSelected: selectedFilter == 'sepia',
                            onTap: () => setState(() => selectedFilter =
                                selectedFilter == 'sepia' ? null : 'sepia'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface.withValues(alpha: 0.3),
        foregroundColor: isSelected
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSurface,
        elevation: isSelected ? 4 : 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: onTap,
      child: Text(label),
    );
  }
}
