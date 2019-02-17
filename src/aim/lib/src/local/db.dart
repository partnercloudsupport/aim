import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

import '../logger.dart';
import '../assets.dart';
import '../util/time.dart';
import '../model/user.dart';

// storage database
class StorageDB {
  // sqflite database objecgt
  final _SqfliteDBManager _manager = _SqfliteDBManager();

  /// init storage database
  Future<StorageDB> init() async {
    await _manager.init();
    return this;
  }

  /// get user optional stocks
  Future<List<ModelUserStock>> getUserStocks() async {
    try{
      String sql = 'select `id`, `code`, `name`, `order`, `deleted`, `ctime`, `dtime` from `tb_user_stock` order by `order` desc';
      var results = await this._manager.db.rawQuery(sql);
      return results?.map<ModelUserStock>((item){return ModelUserStock.initWith(zqdm: item['code'], zqmc: item['name'], order: item['order'], deleted: item['deleted'], ctime: item['ctime'], dtime: item['dtime']);})?.toList();
    } catch (e){
     return null;
    }
  }

  /// get user stock by stock code
  Future<ModelUserStock> getUserStock(String code) async {
    try{
      String sql = 'select `id`, `code`, `name`, `order`, `deleted`, `ctime`, `dtime` from `tb_user_stock` where `code`=?';
      var results = await this._manager.db.rawQuery(sql, [code]);
      return results?.map<ModelUserStock>((item){return ModelUserStock.initWith(zqdm: item['code'], zqmc: item['name'], order: item['order'], deleted: item['deleted'], ctime: item['ctime'], dtime: item['dtime']);})?.toList()?.first;
    } catch(e) {
      return null;
    }
  }

  /// get current user stocks max order value
  Future<int> getUserStockMaxOrderValue() async {
    try{
      String sql = 'select max(`order`) as `order` from `tb_user_stock`';
      var results = await this._manager.db.rawQuery(sql);
      return results.map<int>((item){return item['order'];})?.toList()?.first ?? 1;
    }catch(e){
      return 1;
    }
  }

  /// add user optional stock
  Future<void> addUserStock(String code, String name) async {
    try{
      ModelUserStock stock = await this.getUserStock(code);
      if(stock != null){
        String sql = 'update `tb_user_stock` set `deleted`=? where `code`=?';
        await this._manager.db.rawUpdate(sql, [false, code]);
        return;
      }

      int order = await this.getUserStockMaxOrderValue();
      String sql = 'insert into `tb_user_stock` (`code`, `name`, `order`, `deleted`, `ctime`) values(?, ?, ?, ?, ?)';
      await this._manager.db.rawInsert(sql, [code, name, order, false, TimeUtil.getTimestamp()]);
    }catch(e){}
  }

  /// reorder user stock
  Future<void> moveUserStock(String sourceCode, String targetCode) async {
    try{
      ModelUserStock source = await this.getUserStock(sourceCode);
      ModelUserStock target = await this.getUserStock(targetCode);

      if(target.order > source.order){
        // move source up
        String sql = 'update `tb_user_stock` set `order`=`order`-1 where `order`<=?';
        await this._manager.db.rawUpdate(sql, [target.order]);

        sql = 'update `tb_user_stock` set `order`=? where `code`=?';
        await this._manager.db.rawUpdate(sql, [target.order, source.id]);
      } else {
        // move source down
        String sql = 'update `tb_user_stock` set `order`=`order`+1 where `order`>=? and `order`<?';
        await this._manager.db.rawUpdate(sql, [target.order, source.order]);

        sql = 'update `tb_user_stock` set `order`=? where `code`=?';
        await this._manager.db.rawUpdate(sql, [target.order, source.id]);
      }
    }catch(e){}
  }

  /// update user stock
  Future<int> updateUserStock(String code, String name) async {
    try{
      String sql = 'update `tb_user_stock` set `name`=? where `code`=?';
      return await this._manager.db.rawUpdate(sql, [name, code]);
    }catch(e){
      return 0;
    }
  }

  /// delete user optional stock
  Future<int> removeUserStock(String code) async {
    try{
      String sql = 'update `tb_user_stock` set `deleted`=? where `code`=?';
      return await this._manager.db.rawUpdate(sql, [true, code]);
    }catch(e) {
      return 0;
    }
  }
}

/// sqflite database manager
class _SqfliteDBManager {
  // database name
  static final String _DBName = 'aim.db';
  // database version
  static final int _DBVersion = 1;

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
      version: _DBVersion,
      onOpen: this._open,
      onCreate: this._create,
    );
  }

  Future<void> _open(Database db) async {
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
