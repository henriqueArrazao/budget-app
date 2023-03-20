import 'package:get_it/get_it.dart';
import 'package:sample_project/services/database/app_database.dart';
import 'package:sample_project/src/layers/controllers/global_shared_controller/interfaces/global_config_setter.dart';
import 'package:sample_project/src/layers/data/repositories/transactions_repository.dart';

import 'src/layers/controllers/global_shared_controller/global_config_controller.dart';
import 'src/layers/data/repositories/config_repository.dart';

final getIt = GetIt.instance;

void setupGlobalInjections() {
  getIt.registerLazySingleton(() => AppDatabase());

  getIt.registerLazySingleton<ConfigRepository>(
    () => ConfigRepositoryImpl(db: getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<TransactionsRepository>(
    () => TransactionsRepositoryImpl(db: getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<GlobalConfigController>(() =>
      GlobalConfigController(configRepository: getIt<ConfigRepository>()));

  getIt.registerLazySingleton<GlobalConfigSetter>(
      () => getIt<GlobalConfigController>());
}
