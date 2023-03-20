import 'package:drift/drift.dart';
import 'package:sample_project/services/database/app_database.dart';

class CreateTransactionModel {
  final String? description;
  final double amount;
  final DateTime date;

  CreateTransactionModel({
    this.description,
    required this.amount,
    required this.date,
  });

  Insertable<TransactionOperationData> toDB() {
    return TransactionOperationCompanion.insert(
      description: Value(description),
      amount: amount,
      date: date,
    );
  }
}
