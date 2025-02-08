import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';

class VibranceFilterConfiguration extends ShaderConfiguration {
  final NumberParameter _vibrance;

  VibranceFilterConfiguration()
      : _vibrance = ShaderRangeNumberParameter(
          'inputVibrance', // uniform name
          'vibrance', // display name
          0,
          0, // default value
          min: 0, // minimum value
          max: 1.0, // maximum value
        ),
        super([0.0]); // default values

  // custom setter (optional)
  set vibrance(double value) {
    _vibrance.value = value;
    _vibrance.update(this);
  }

  // enlist all parameters
  @override
  List<ConfigurationParameter> get parameters => [_vibrance];
}
