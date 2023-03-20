import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class Config extends Table {
  IntColumn get id => integer().autoIncrement()();

  RealColumn get balance => real()();
  RealColumn get monthlyLimit => real()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// 'transaction' is a reserved word in 'drift'
class TransactionOperation extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get description => text().nullable()();
  RealColumn get amount => real()();
  DateTimeColumn get date => dateTime()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [Config, TransactionOperation])
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
