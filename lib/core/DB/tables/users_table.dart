import 'package:drift/drift.dart';

class UsersTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text().unique()();
  TextColumn get name => text()();
  TextColumn get role => text().withDefault(const Constant("owner"))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
