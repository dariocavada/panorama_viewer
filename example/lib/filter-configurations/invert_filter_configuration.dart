import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';

class InvertFilterConfiguration extends ShaderConfiguration {
  final NumberParameter _invert;

  InvertFilterConfiguration()
      : _invert = ShaderRangeNumberParameter(
          'inputInvert', // uniform name
          'invert', // display name
          0,
          0, // default value
          min: 0, // minimum value
          max: 1.0, // maximum value
        ),
        super([0.0]); // default values

  // custom setter (optional)
  set invert(double value) {
    _invert.value = value;
    _invert.update(this);
  }

  // enlist all parameters
  @override
  List<ConfigurationParameter> get parameters => [_invert];
}
