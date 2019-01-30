import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

import '../assets.dart';
import '../util/time.dart';
import '../model/stock.dart';

// storage database
class StorageDB {
  // sqflite database objecgt
  final _SqfliteDBManager _manager = _SqfliteDBManager();

  /// init storage database
  Future<void> init() async {
    await _manager.init();
  }

  /// get user optional stocks
  Future<List<ModelStock>> getUserStocks() async {
    try{
      String sql = 'select id, code, name, ctime from tb_user_stock';
      var results = await this._manager.db.rawQuery(sql);
      return results?.map<ModelStock>((item){return ModelStock.initWith(zqdm: item['code'], zqmc: item['name']);})?.toList()??[];
    } catch (e){
     return [];
    }
  }
  /// get user stock by stock code
  Future<ModelStock> getUserStock(String code) async {
    String sql = 'select id, code, name, ctime from tb_user_stock where code=?';
    var results = await this._manager.db.rawQuery(sql, [code]);
    return results?.map<ModelStock>((item){return ModelStock.initWith(zqdm: item['code'], zqmc: item['name']);})?.toList()?.first;
  }
  /// add user optional stock
  Future<void> addUserStock(String code, String name) async {
    ModelStock stock = await this.getUserStock(code);
    if(stock != null)
      return;

    String sql = 'insert into tb_user_stock(code, name, ctime) values(?, ?, ?)';
    await this._manager.db.rawInsert(sql, [code, name, TimeUtil.getTimestamp()]);
  }
  /// update user stock
  Future<int> updateUserStock(String code, String name) async {
    String sql = 'update tb_user_stock set name=? where code=?';
    return await this._manager.db.rawUpdate(sql, [name, code]);
  }
  /// delete user optional stock
  Future<int> delUserStock(String code) async {
    String sql = 'delete from tb_user_stock where code=?';
    return await this._manager.db.rawDelete(sql, [code]);
  }
}

/// sqflite database manager
class _SqfliteDBManager {
  // database name
  static final String _DBName = 'aim.db';
  // sqflite database object
  Database _db;

  // get db object
  Database get db => this._db;

  Future<void> init() async {
    // database file path
    String path = await getDatabasesPath() + "/" + _DBName;
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

  Future<void> _open(Database db) async {

  }

  Future<void> _configure(Database db) async {

  }

  Future<void> _create(Database db, int version) async {
    String sql = await rootBundle.loadString(Assets.sqlCreate);
    db.execute(sql);
  }

  Future<void> _upgrade(Database db, int oldVersion, int newVersion) async {

  }

  Future<void> _downgrade(Database db, int oldVersion, int newVersion) async {

  }
}