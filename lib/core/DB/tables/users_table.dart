import 'package:drift/drift.dart';

import '../../enums/user_rule_enum.dart';

class UsersTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text().unique()();
  TextColumn get name => text()();
  IntColumn get role =>
      intEnum<UserRule>().withDefault(Constant(UserRule.cashier.index))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
