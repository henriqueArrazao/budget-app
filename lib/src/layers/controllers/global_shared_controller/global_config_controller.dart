import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:sample_project/src/core/failure/failure.dart';
import 'package:sample_project/src/layers/data/models/config_model.dart';
import 'package:sample_project/src/layers/data/repositories/config_repository.dart';

import './interfaces/global_config_setter.dart';
import 'global_config_state.dart';

class GlobalConfigController extends ValueNotifier<GlobalConfigState>
    implements GlobalConfigSetter {
  final ConfigRepository _configRepository;
  GlobalConfigController({
    required ConfigRepository configRepository,
    GlobalConfigState? state,
  })  : _configRepository = configRepository,
        super(state ??
            GlobalConfigState(
              loaded: false,
              config: null,
            ));

  Future<Either<Failure, ConfigModel?>> loadData({bool force = false}) async {
    if (value.loaded && !force) {
      return Right(value.config);
    }

    final result = await _configRepository.getConfig();
    return result.fold(
      (failure) => Left(failure),
      (config) {
        value = GlobalConfigState(loaded: true, config: config);
        return Right(config);
      },
    );
  }

  @override
  void setConfig(ConfigModel config) {
    value = value.copyWith(config: config);
  }
}
