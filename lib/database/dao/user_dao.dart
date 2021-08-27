import 'package:sqflite/sqflite.dart';
import 'package:test_app/common/database_strings.dart';
import 'package:test_app/database/dao/data_access_object.dart';

class UserDao implements DataAccessObject {
  Database db;

  UserDao(this.db);

  @override
  createTable(Database db) async {
    await db.execute(
      "CREATE TABLE $userTableName( "
        "$identifier INTEGER PRIMARY KEY, "
        "$name TEXT, "
        "$email TEXT, "
        "$password TEXT, "
        "$document TEXT)"
    );
  }

  @override
  Future get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  insert(item) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  insertAll(List items) {
    // TODO: implement insertAll
    throw UnimplementedError();
  }

  @override
  remove(item) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  removeAll(List items) {
    // TODO: implement removeAll
    throw UnimplementedError();
  }

  @override
  removeNoneExisting(List newItems) {
    // TODO: implement removeNoneExisting
    throw UnimplementedError();
  }

  @override
  update(item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
