import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_project/src/core/failure/failure.dart';
import 'package:sample_project/src/layers/controllers/global_shared_controller/global_config_controller.dart';
import 'package:sample_project/src/layers/controllers/global_shared_controller/global_config_state.dart';
import 'package:sample_project/src/layers/data/repositories/config_repository.dart';

import './../../../../mocks/test_mocks.dart';

class ConfigRepositoryMock extends Mock implements ConfigRepository {}

void main() {
  late ConfigRepository repository;
  late GlobalConfigController controller;

  setUp(() {
    repository = ConfigRepositoryMock();
    controller = GlobalConfigController(configRepository: repository);
  });

  group('loadData', () {
    group('initial', () {
      test('load success', () async {
        when(() => repository.getConfig())
            .thenAnswer((_) async => Right(TestMocks.configModel));

        final result1 = await controller.loadData();

        verify(() => repository.getConfig()).called(1);

        expect(controller.value.loaded, true);
        expect(controller.value.config, TestMocks.configModel);
        expect(result1, Right(controller.value.config));
      });

      test('load failure', () async {
        when(() => repository.getConfig())
            .thenAnswer((_) async => Left(Failure()));
        final result = await controller.loadData();

        verify(() => repository.getConfig()).called(1);

        expect(controller.value.loaded, false);
        expect(controller.value.config, null);
        expect(result, Left(Failure()));
      });
    });

    group('already loaded with force parameter', () {
      test('as false', () async {
        final controller = GlobalConfigController(
            configRepository: repository,
            state: GlobalConfigState(loaded: true, config: null));
        when(() => repository.getConfig())
            .thenAnswer((_) async => Right(TestMocks.configModel));

        final result = await controller.loadData();

        verifyNever(() => repository.getConfig());
        expect(result, Right(controller.value.config));
      });
    });

    test('as true', () async {
      final controller = GlobalConfigController(
          configRepository: repository,
          state: GlobalConfigState(loaded: true, config: null));
      when(() => repository.getConfig())
          .thenAnswer((_) async => Right(TestMocks.configModel));

      final result = await controller.loadData(force: true);

      verify(() => repository.getConfig()).called(1);
      expect(result, Right(controller.value.config));
    });
  });

  test('setConfig', () {
    controller.setConfig(TestMocks.configModel);
    expect(controller.value.config, TestMocks.configModel);
  });
}
