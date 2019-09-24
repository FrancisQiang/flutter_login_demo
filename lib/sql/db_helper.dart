import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final String tableUser = 't_user';
final String columnAccount = 'account';
final String columnPassword = 'password';
final String columnName = 'name';
final String columnEmail = 'email';

class User {
  String account;
  String password;
  String name;
  String email;


  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnAccount: account,
      columnPassword: password,
      columnName: name,
      columnEmail: email
    };
    return map;
  }

  User();

  User.fromMap(Map<String, dynamic> map) {
    account = map[columnAccount];
    password = map[columnPassword];
    name = map[columnName];
    email = map[columnEmail];
  }
}

class LoginUserVO {

  String _name;
  String _email;

  String get name => _name;

  set name(String value) => this._name = value;

  String get email => _email;

  set email(String value) => this._email = value;

  LoginUserVO.fromMap(Map<String, dynamic> map) {
    name = map[columnName];
    email = map[columnEmail];
  }

}

class DBProvider {
  // 创建DBProvider的单例
  DBProvider._internal();

  factory DBProvider() =>_getInstance();
  static DBProvider get instance => _getInstance();
  static DBProvider _instance;

  static DBProvider _getInstance() {
    if (_instance == null) {
      _instance = new DBProvider._internal();
    }
    return _instance;
  }

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "UserDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('''
            create table $tableUser ( 
              $columnAccount VARCHAR(16) primary key,
              $columnPassword VARCHAR(32) not null,
              $columnName VARCHAR(16) not null,
              $columnEmail VARCHAR(64) not null
              );
            ''');
        });
  }

  Future<int> insert(User user) async {
    final db = await database;
    return db.insert(tableUser, user.toMap());
  }

  Future<LoginUserVO> login(String account, String password) async {
    final db = await database;
    List<Map> maps = await db.query(tableUser,
        columns: [columnName, columnEmail],
        where: '$columnAccount = ? and $columnPassword = ?',
        whereArgs: [account, password]);
    if (maps.length > 0) {
      return LoginUserVO.fromMap(maps.first);
    }
    return null;
  }

  removeAll() async {
    final db = await database;
    db.delete(tableUser);
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}