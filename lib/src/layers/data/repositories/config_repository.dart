import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:sample_project/services/database/app_database.dart';
import 'package:sample_project/services/logger/error_logger.dart';

import '../../../core/failure/failure.dart';
import '../models/config_model.dart';

abstract class ConfigRepository {
  Future<Either<Failure, void>> upsertConfig(ConfigModel config);
  Future<Either<Failure, ConfigModel?>> getConfig();
}

class ConfigRepositoryImpl implements ConfigRepository {
  final AppDatabase _db;
  ConfigRepositoryImpl({
    required AppDatabase db,
  }) : _db = db;

  @override
  Future<Either<Failure, void>> upsertConfig(ConfigModel config) async {
    try {
      await _db.into(_db.config).insertOnConflictUpdate(config.toDB().copyWith(
            id: const Value(1),
          ));
      return const Right(null);
    } catch (e, s) {
      ErrorLogger.log(e, s);
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, ConfigModel?>> getConfig() async {
    try {
      final config = await _db.select(_db.config).getSingleOrNull();
      return Right(config != null ? ConfigModel.fromDB(config) : null);
    } catch (e, s) {
      ErrorLogger.log(e, s);
      return Left(Failure());
    }
  }
}
