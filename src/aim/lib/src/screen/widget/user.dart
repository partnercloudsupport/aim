import 'package:flutter/material.dart';
import 'stock.dart';
import '../../model/stock.dart';

class UserStocksWidget extends StatelessWidget {
  final List<ModelStock> stocks;
  final Function() onAdd;
  final Function(ModelStock) onTap;
  UserStocksWidget({Key key, this.stocks, this.onAdd, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    if((this.stocks?.length??0) > 0){
      return StockListWidget(
        stocks: this.stocks,
        onTap: this.onTap,
      );
    } else {
      return UserStocksEmptyWidget(
        onAdd: this.onAdd,
      );
    }
  }
}

class UserStocksEmptyWidget extends StatelessWidget {
  final void Function() onAdd;
  UserStocksEmptyWidget({Key key, @required this.onAdd}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              border:Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid
              )
          ),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                '',
                style: TextStyle(
                    height: 1.8
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.add,
                  size: 44,
                  color: Colors.grey,
                ),
              ),
              Text(
                '添加自选',
                style: TextStyle(
                    height: 1.8,
                    color: Colors.grey
                ),
              ),
            ],
          ),
        ),
        onPressed: (){
          if(this.onAdd != null){
            this.onAdd();
          }
        },
      ),
    );
  }
}