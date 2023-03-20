import 'package:sample_project/src/layers/data/models/config_model.dart';

class GlobalConfigState {
  final bool loaded;
  final ConfigModel? config;

  GlobalConfigState({
    required this.loaded,
    required this.config,
  });

  GlobalConfigState copyWith({
    bool? loaded,
    ConfigModel? config,
  }) {
    return GlobalConfigState(
      loaded: loaded ?? this.loaded,
      config: config ?? this.config,
    );
  }
}
