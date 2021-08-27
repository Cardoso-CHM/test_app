import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/database/dao/user_dao.dart';

abstract class DataStoreHelper {
  void create(Database db, int version);
  Future<Database> connect();
  void disconnect();
  void createDaos();
  void delete();
  void preload();
}

class DataStore implements DataStoreHelper {
  late Database db;
  String dbName = 'mydb.db';
  late String path;

  late UserDao userDao;

  @override
  Future<Database> connect() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, dbName);

    bool dbExists = await databaseExists(path);
    if (dbExists) {
      await Directory(databasesPath).create(recursive: true);
    }

    db = await openDatabase(path, version: 1, onCreate: create);
    createDaos();
    return db;
  }

  @override
  void create(Database db, int version) async{
    userDao.createTable(db);
  }

  @override
  void createDaos() {
    userDao = UserDao(db);
  }

  @override
  void delete() {
    // TODO: implement delete
  }

  @override
  void disconnect() {
    // TODO: implement disconnect
  }

  @override
  void preload() {
    // TODO: implement preload
  }
}
