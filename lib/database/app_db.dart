import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/models/user.dart';

class AppDB {
  static final AppDB instance = AppDB._init();
  static Database? _database;

  AppDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('test_app.db');

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $userTable (
        ${UserFields.id} TEXT PRIMARY KEY,
        ${UserFields.name} TEXT NOT NULL,
        ${UserFields.profile} TEXT NOT NULL,
        ${UserFields.token} TEXT NOT NULL
      )
    ''');
  }

  Future<User?> createUser(User user) async {
    final db = await instance.database;

    await db.insert(userTable, user.toJson());

    return user;
  }

  Future<User?> getLoggedUser() async {
    final db = await instance.database;

    final result = await db.query(userTable, limit: 1);

    if(result.isNotEmpty) {
      return User.fromJson(result.first);
    }
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
