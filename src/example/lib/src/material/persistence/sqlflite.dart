import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sqf;
import '../../scaffold_page.dart';


class SqfliteExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'Sqflite',
      child: SqfliteExampleWidget(),
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

  void load() async{
    await mydb.open();
    users = await mydb.list();
    setState(() {});
  }

  void add(context) async{
    var result = await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: FormEditorWidget(),
        );
      }
    );

    if(result==null)
      return;

    var newuser = await mydb.insert(UserItem(id:result['id'], name: result['name']));

    setState(() {
      users.add(newuser);
    });
  }

  void update(context) async{
    if(selected == null)
      return;

    var result = await showDialog(
        context: context,
        builder: (context) {
          var user = users[selected];
          return Dialog(
            child: FormEditorWidget(id: user.id, name: user.name,),
          );
        }
    );

    if(result==null)
      return;
    var newUser = UserItem(id:result['id'], name: result['name']);
    int id = await mydb.update(newUser);
    print('update: $id');
    setState(() {
      users[selected] = newUser;
    });
  }

  void delete() async {
    if(selected == null)
      return;

    int id = await mydb.delete(users[selected].id);
    print('delete: $id');
    setState(() {
      users.removeAt(selected);
    });
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
                    add(context);
                  },
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text('update'),
                  onPressed: (){
                    update(context);
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
      //enabled: selected,
      onTap: (){
        onClick(index);
      },
    );
  }
}


class FormEditorWidget extends StatefulWidget {
  int id;
  String name;

  FormEditorWidget({Key key, this.id, this.name});

  @override
  State<StatefulWidget> createState() {
    return FormEditorWidgetState();
  }
}


class FormEditorWidgetState extends State<FormEditorWidget> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if(widget.id != null)
      _idController.text = widget.id.toString();
    if(widget.name != null)
      _nameController.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _idController,
              decoration: InputDecoration(
                icon: Icon(Icons.info),
                labelText: "ID",
                hintText: "请输入ID",
              ),
              validator: (val){
                return val.trim().length > 0 ? null : '用户ID不能为空';
              },
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: "Name",
                hintText: "请输入Name",
              ),
              validator: (val){
                return val.trim().length > 0 ? null : '用户名称不能为空';
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text('取消'),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text('确定'),
                      onPressed: (){
                        if((_formKey.currentState as FormState).validate()){
                          Navigator.of(context).pop(<String, dynamic>{
                            'id': int.parse(_idController.text),
                            'name': _nameController.text
                          });
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
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

    String createSql = "create table if not exists tb_user("
        "id integer primary key,"
        "name char(16) not null"
        ')';

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
        db.execute(createSql);
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

    await _db.execute(createSql);
    print('created');
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
    if(_db == null)
      return List<UserItem>();

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


