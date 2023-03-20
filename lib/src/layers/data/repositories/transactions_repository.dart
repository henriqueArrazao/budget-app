import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:sample_project/services/database/app_database.dart';
import 'package:sample_project/services/logger/error_logger.dart';
import 'package:sample_project/src/layers/data/models/create_transaction_model.dart';
import 'package:sample_project/src/layers/data/models/transaction_model.dart';

import '../../../core/failure/failure.dart';

abstract class TransactionsRepository {
  Future<Either<Failure, List<TransactionModel>>> getTransactionsByMonth(
    DateTime monthDate,
  );
  Future<Either<Failure, void>> insertTransaction(
    CreateTransactionModel transaction,
  );
  Future<Either<Failure, void>> deleteTransaction(
    TransactionModel transaction,
  );
}

class TransactionsRepositoryImpl implements TransactionsRepository {
  final AppDatabase _db;
  TransactionsRepositoryImpl({
    required AppDatabase db,
  }) : _db = db;

  @override
  Future<Either<Failure, List<TransactionModel>>> getTransactionsByMonth(
    DateTime monthDate,
  ) async {
    try {
      final transactions = await (_db.select(_db.transactionOperation)
            ..where((row) => row.date.month.equals(monthDate.month))
            ..where((row) => row.date.year.equals(monthDate.year))
            ..orderBy([
              (table) =>
                  OrderingTerm(expression: table.date, mode: OrderingMode.desc),
              (table) => OrderingTerm(
                  expression: table.createdAt, mode: OrderingMode.desc)
            ]))
          .get();
      return Right(
        transactions.map((row) {
          return TransactionModel.fromDB(row);
        }).toList(),
      );
    } catch (e, s) {
      ErrorLogger.log(e, s);
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, void>> insertTransaction(
    CreateTransactionModel transaction,
  ) async {
    try {
      await _db.transaction(() async {
        await _db
            .into(_db.transactionOperation)
            .insertOnConflictUpdate(transaction.toDB());
        await _db.customUpdate(
          '''UPDATE ${_db.config.actualTableName}
          SET ${_db.config.balance.name} = ${_db.config.balance.name} + ?''',
          variables: [
            Variable.withReal(transaction.amount),
          ],
        );
      });

      return const Right(null);
    } catch (e, s) {
      ErrorLogger.log(e, s);
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTransaction(
    TransactionModel transaction,
  ) async {
    try {
      await _db.transaction(() async {
        await (_db.delete(_db.transactionOperation)
              ..where((row) => row.id.equals(transaction.id)))
            .go();
        await _db.customUpdate(
          '''UPDATE ${_db.config.actualTableName}
          SET ${_db.config.balance.name} = ${_db.config.balance.name} - ?''',
          variables: [
            Variable.withReal(transaction.amount),
          ],
        );
      });

      return const Right(null);
    } catch (e, s) {
      ErrorLogger.log(e, s);
      return Left(Failure());
    }
  }
}
