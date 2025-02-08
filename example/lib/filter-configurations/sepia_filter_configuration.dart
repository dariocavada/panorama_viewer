import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';

class SepiaFilterConfiguration extends ShaderConfiguration {
  final NumberParameter _sepia;

  SepiaFilterConfiguration()
      : _sepia = ShaderRangeNumberParameter(
          'inputSepia', // uniform name
          'sepia', // display name
          0,
          0, // default value
          min: 0, // minimum value
          max: 1.0, // maximum value
        ),
        super([0.0]); // default values

  // custom setter (optional)
  set sepia(double value) {
    _sepia.value = value;
    _sepia.update(this);
  }

  // enlist all parameters
  @override
  List<ConfigurationParameter> get parameters => [_sepia];
}
