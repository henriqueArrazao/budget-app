import 'package:sample_project/services/database/app_database.dart';

class TransactionModel {
  final int id;
  final String? description;
  final double amount;
  final DateTime date;

  TransactionModel({
    required this.id,
    this.description,
    required this.amount,
    required this.date,
  });

  factory TransactionModel.fromDB(TransactionOperationData data) {
    return TransactionModel(
      id: data.id,
      description: data.description,
      amount: data.amount,
      date: data.date,
    );
  }
}
