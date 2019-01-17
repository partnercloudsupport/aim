import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sqf;
import '../../scaffold_page.dart';


class SqfliteExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'Sqflite',
      child: Container(
        child: SqfliteExampleWidget(),
      )
    );
  }
}

class SqfliteExampleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SqfliteExampleWidgetState();
  }
}


class SqfliteExampleWidgetState extends State<SqfliteExampleWidget> {
  int selected;
  List<UserItem> users = [];
  MyDatabase mydb = MyDatabase();

  @override
  void initState() {
    super.initState();
  }

  void load() {
    mydb.open();
  }

  void add() {

  }

  void update() {

  }

  void delete() {

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text('load'),
                  onPressed: (){
                    load();
                  },
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text('add'),
                  onPressed: (){
                    add();
                  },
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text('update'),
                  onPressed: (){
                    update();
                  },
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text('delete'),
                  onPressed: (){
                    delete();
                  },
                ),
              ),
            ],
          ),
        ),

        Expanded(
          flex: 8,
          child: Builder(
            builder: (context){
              if(users==null || users.length==0){
                return Container(
                  alignment: Alignment.center,
                  child: Text('no record'),
                );
              } else {
                return ListView.builder(
                  itemCount: users.length ,
                  itemBuilder: (context, index) {
                    return UserItemWidget(
                      index: index,
                      user: users[index],
                      selected: selected==index,
                      onClick: (index) {
                        selected = index;
                      },
                    );
                  },
                );
              }
            },
          )
        )
      ],
    );
  }
}

typedef void onClickCallBack(int index);

class UserItemWidget extends StatelessWidget {
  final int index;
  final UserItem user;
  final bool selected;
  final onClickCallBack onClick;

  UserItemWidget({Key key, @required this.index, @required this.user, this.selected, this.onClick}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(user.id.toString()),
      title: Text(user.name),
      enabled: selected,
      onTap: (){
        onClick(index);
      },
    );
  }
}


class UserItem {
  int id;
  String name;
  
  UserItem({this.id, this.name});

  Map<String, dynamic> asMap() {
    var value = <String, dynamic> {
      'name': name
    };

    if(id != null){
      value['id'] = id;
    }

    return value;
  }
}


class MyDatabase {
  sqf.Database _db;
  
  Future<void> open() async {
    if(_db != null)
      return;

    // database file path
    String path = await sqf.getDatabasesPath() + "/demo.db";
    // open database
    _db = await sqf.openDatabase(
      path,
      version: 1,
      onConfigure: (db) {
        print('on configure');
      },
      onCreate: (db, version) {
        print('on create, version $version');
        String sql = "create table tb_user("
                        "id integer not null autoincrement,"
                        "name char(16) not null default '',"
                        "primary key(id)"
                      ')';
        db.execute(sql);
      },
      onUpgrade: (db, oldVersion, newVersion) {
        print('on upgrade, old version: $oldVersion, new version: $newVersion');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        print('on downgrade, old version: $oldVersion, new version: $newVersion');
      },
      onOpen: (db) {
        print('on open');
      }
    );
  }
  
  Future<UserItem> insert(UserItem user) async {
    user.id = await _db.insert('tb_user', user.asMap());
    return user;
  }

  Future<int> delete(int id) async {
    return await _db.delete('tb_user', where: 'id=?', whereArgs: [id]);
  }

  Future<int> update(UserItem user) async {
    return await _db.update('tb_user', user.asMap(), where: 'id=?', whereArgs: [user.id]);
  }

  Future<List<UserItem>> list() async {
    List<Map> users = await _db.query('tb_user', columns: ['id', 'name']);
    return users.map((item){
      return UserItem(id: item['id'], name: item['name']);
    }).toList();
  }

  Future<void> close() async {
    if(_db == null)
      return;

    await _db.close();
  }
}