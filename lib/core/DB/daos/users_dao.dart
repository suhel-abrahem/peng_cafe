import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/users_table.dart';

part 'users_dao.g.dart';

@DriftAccessor(tables: [UsersTable])
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  UsersDao(super.db);

  Future<int> insertUser(UsersTableCompanion user) =>
      into(usersTable).insert(user);
  Future<UsersTableData?> getUserById(int id) {
    return (select(
      usersTable,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<List<UsersTableData>> getAllUsers() => select(usersTable).get();

  Stream<List<UsersTableData>> watchUsers() => select(usersTable).watch();
}
