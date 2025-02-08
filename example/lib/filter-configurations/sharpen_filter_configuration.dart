import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';

class SharpenFilterConfiguration extends ShaderConfiguration {
  final NumberParameter _sharpen;

  SharpenFilterConfiguration()
      : _sharpen = ShaderRangeNumberParameter(
          'inputSharpen', // uniform name
          'sharpen', // display name
          0,
          0, // default value
          min: 0, // minimum value
          max: 5.0, // maximum value
        ),
        super([0.0]); // default values

  // custom setter (optional)
  set sharpen(double value) {
    _sharpen.value = value;
    _sharpen.update(this);
  }

  // enlist all parameters
  @override
  List<ConfigurationParameter> get parameters => [_sharpen];
}
