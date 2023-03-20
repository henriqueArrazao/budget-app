import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/src/core/failure/failure.dart';
import 'package:sample_project/src/layers/controllers/global_shared_controller/interfaces/global_config_setter.dart';
import 'package:sample_project/src/layers/data/models/config_model.dart';
import 'package:sample_project/src/layers/data/repositories/config_repository.dart';

class ConfigPageState {
  final bool isLoading;
  ConfigPageState({
    this.isLoading = false,
  });
  ConfigPageState copyWith({
    bool? isLoading,
  }) {
    return ConfigPageState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class ConfigPageController extends ValueNotifier<ConfigPageState> {
  final ConfigRepository _configRepository;
  final GlobalConfigSetter _globalConfigSetter;
  ConfigPageController({
    required ConfigRepository configRepository,
    required GlobalConfigSetter globalConfigSetter,
  })  : _configRepository = configRepository,
        _globalConfigSetter = globalConfigSetter,
        super(ConfigPageState());

  Future<Either<Failure, void>> submit(ConfigModel config) async {
    value = value.copyWith(isLoading: true);
    final res = await _configRepository.upsertConfig(config);

    return res.fold(
      (failure) {
        value = value.copyWith(isLoading: false);
        return Left(failure);
      },
      (_) {
        _globalConfigSetter.setConfig(config);
        return const Right(null);
      },
    );
  }
}
