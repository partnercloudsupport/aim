import 'package:flutter/material.dart';


class MyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Dialog'),
      onPressed: () async{
        var result = await showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: FormEditorWidget(),
            );
          }
        );

        print(result);
      },
    );
  }
}


class FormEditorWidget extends StatefulWidget {
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
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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