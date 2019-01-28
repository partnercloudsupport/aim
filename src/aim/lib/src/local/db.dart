import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

import '../assets.dart';

// database name
const String DBName = 'aim.db';

// storage database
class StorageDB {
  // sqflite database objecgt
  Database _db;

  void _open(Database db) async {

  }

  void _configure(Database db) async {

  }

  void _create(Database db, int version) async {
    String sql = await rootBundle.loadString(Assets.sqlCreate);
    db.execute(sql);
  }

  void _upgrade(Database db, int oldVersion, int newVersion) async {

  }

  void _downgrade(Database db, int oldVersion, int newVersion) async {

  }


  Future<void> init() async {
    // database file path
    String path = await getDatabasesPath() + "/" + DBName;
    // open database
    this._db = await openDatabase(
        path,
        version: 1,
        onOpen: this._open,
        onCreate: this._create,
        onUpgrade: this._upgrade,
        onDowngrade: this._downgrade,
        onConfigure: this._configure,
    );
  }
}