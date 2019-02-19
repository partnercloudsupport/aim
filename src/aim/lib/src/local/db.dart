import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

import '../logger.dart';
import '../assets.dart';
import '../util/time.dart';
import '../model/user.dart';

// storage database
class StorageDB {
  // sqflite database objecgt
  final _SqfliteDB _db = _SqfliteDB();

  // user stock table
  _TableUserStock tableUserStock;

  /// init storage database
  Future<StorageDB> open() async {
    // open database
    await _db.open();

    // init tables
    this.tableUserStock = _TableUserStock(this._db);

    return this;
  }

  Future<void> close() async {
    await _db.close();
  }
}

// sqflite database manager
class _SqfliteDB {
  // database name
  static final String _name = 'aim.db';
  // database version
  static final int _version = 1;

  // sqflite database object
  Database _db;
  // get db object
  Database get db => this._db;
  // get batch object
  Batch batch() => this._db?.batch();

  Future<void> open() async {
    // database file path
    String path = await getDatabasesPath() + "/" + _name;
    // open database
    this._db = await openDatabase(path, version: _version, onCreate: this._create,);
  }

  Future<dynamic> query(String sql, [List<dynamic> arguments]) async {
    try{
      if(this._db == null){
        return 0;
      }
      Batch batch = this._db.batch();
      batch.rawQuery(sql, arguments);
      List<dynamic> results = await batch.commit();
      return results[0];
    } catch(e){
      print(e);
    }
  }

  Future<int> insert(String sql, [List<dynamic> arguments]) async {
    if(this._db == null){
      return 0;
    }
    Batch batch = this._db.batch();
    batch.rawInsert(sql, arguments);
    List<dynamic> results = await batch.commit();
    return results[0];
  }

  Future<int> update(String sql, [List<dynamic> arguments]) async {
    if(this._db == null){
      return 0;
    }
    Batch batch = this._db.batch();
    batch.rawUpdate(sql, arguments);
    List<dynamic> results = await batch.commit();
    return results[0];
  }

  Future<int> delete(String sql, [List<dynamic> arguments]) async {
    if(this._db == null){
      return 0;
    }
    Batch batch = this._db.batch();
    batch.rawDelete(sql, arguments);
    List<dynamic> results = await batch.commit();
    return results[0];
  }

  Future<void> close() async {
    if(this._db != null) {
      await this._db.close();
    }
  }

  Future<void> _create(Database db, int version) async {
    try{
      String strSqls = await rootBundle.loadString(Assets.sqlCreate);
      List<String> sqls = strSqls.split(';');
      for(String sql in sqls){
        sql = sql.trim();
        if(sql.isNotEmpty)
          await db.execute(sql);
      }
    } catch(e) {
      Log.error(e);
    }
  }
}

class _TableUserStock {
  final _SqfliteDB db;
  _TableUserStock(this.db);

  /// get user optional stocks
  Future<List<ModelUserStock>> list() async {
    String sql = 'select `id`, `code`, `name`, `order`, `deleted`, `ctime`, `dtime` from `tb_user_stock` where deleted=? order by `order` desc';
    var results = await this.db?.query(sql, [false])??[];
    List<ModelUserStock> stocks = results?.map<ModelUserStock>((item){
      return ModelUserStock.initWith(
        zqdm: item['code'],
        zqmc: item['name'],
        order: item['order'],
        deleted: item['deleted'] == 0 ? false : true,
        ctime: item['ctime'],
        dtime: item['dtime']
      );
    })?.toList();
    return stocks;
  }

  /// get user stock by stock code
  Future<ModelUserStock> select(String code) async {
    String sql = 'select `id`, `code`, `name`, `order`, `deleted`, `ctime`, `dtime` from `tb_user_stock` where `code`=?';
    var results = await this.db?.query(sql, [code]);
    List<ModelUserStock> stocks = results?.map<ModelUserStock>((item){
      return ModelUserStock.initWith(
        zqdm: item['code'],
        zqmc: item['name'],
        order: item['order'],
        deleted: item['deleted'] == 0 ? false : true,
        ctime: item['ctime'],
        dtime: item['dtime']
      );
    })?.toList();

    var stock = (stocks?.length??0) > 0 ? stocks[0] : null;

    return stock;
   }

  /// get current user stocks max order value
  Future<int> getMaxOrderValue() async {
    String sql = 'select max(`order`) as `order` from `tb_user_stock`';
    var results = await this.db?.query(sql);
    return results.map((item){return item['order'];})?.toList()?.first ?? 1;
  }

  /// add user optional stock
  Future<int> insert(String code, String name) async {
    ModelUserStock stock = await this.select(code);
    if(stock != null){
      String sql = 'update `tb_user_stock` set `deleted`=? where `code`=?';
      return await this.db.update(sql, [false, code]);
    } else{
      int order = await this.getMaxOrderValue() + 1;
      String sql = 'insert into `tb_user_stock` (`code`, `name`, `order`, `deleted`, `ctime`) values(?, ?, ?, ?, ?)';
      return await this.db.insert(sql, [code, name, order, false, TimeUtil.getTimestamp()]);
    }
  }

  /// reorder user stock
  Future<void> move(String sourceCode, String targetCode) async {
    ModelUserStock source = await this.select(sourceCode);
    ModelUserStock target = await this.select(targetCode);
    if(source == null || target == null){
      throw 'user stock not exist';
    }

    if(target.order > source.order){
      // move source up
      String sql = 'update `tb_user_stock` set `order`=`order`-1 where `order`<=?';
      await this.db.update(sql, [target.order]);

      sql = 'update `tb_user_stock` set `order`=? where `code`=?';
      await this.db.update(sql, [target.order, source.id]);
    } else {
      // move source down
      String sql = 'update `tb_user_stock` set `order`=`order`+1 where `order`>=? and `order`<?';
      await this.db.update(sql, [target.order, source.order]);

      sql = 'update `tb_user_stock` set `order`=? where `code`=?';
      await this.db.update(sql, [target.order, source.id]);
    }
  }

  /// update user stock
  Future<int> update(String code, String name) async {
    String sql = 'update `tb_user_stock` set `name`=? where `code`=?';
    int count = await this.db.update(sql, [name, code]);
    return count;
  }

  /// delete user optional stock
  Future<int> delete(String code) async {
    String sql = 'update `tb_user_stock` set `deleted`=?, `dtime`=? where `code`=?';
    int count = await this.db.update(sql, [true, TimeUtil.getTimestamp(), code]);
    return count;
  }
}