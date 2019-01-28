import 'package:flutter/material.dart';


class StockSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        centerTitle: true,
        title: Theme(
          data: Theme.of(context).copyWith(inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.red
          )),
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.0
            ),
            decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                hintText: '输入股票代码、名称、拼音',
                border: OutlineInputBorder()
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 150,
          height: 80,
          child: TextField(
            //autofocus: true,
            focusNode: FocusNode(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.0
            ),
            decoration: InputDecoration(
              fillColor: Colors.red,
              contentPadding: EdgeInsets.all(4.0),
              border: OutlineInputBorder()
            ),
          ),
        ),
      )
    );
  }
}