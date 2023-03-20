import 'package:drift/drift.dart';
import 'package:sample_project/services/database/app_database.dart';

class ConfigModel {
  final double balance;
  final double monthlyLimit;

  ConfigModel({
    required this.balance,
    required this.monthlyLimit,
  });

  ConfigCompanion toDB() {
    return ConfigCompanion(
      balance: Value(balance),
      monthlyLimit: Value(monthlyLimit),
    );
  }

  factory ConfigModel.fromDB(ConfigData data) {
    return ConfigModel(
      balance: data.balance,
      monthlyLimit: data.monthlyLimit,
    );
  }
}
