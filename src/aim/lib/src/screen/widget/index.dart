import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../model/index.dart';

class MainIndexesWidget extends StatelessWidget {
  final List<ModelIndex> indexes;
  final Function(ModelIndex) onTap;
  MainIndexesWidget({Key key, @required this.indexes, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 80.0,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MainIndexWidget(index: (this.indexes?.length??0)>0 ? indexes[0] : null, onTap: this.onTap),
          VerticalDivider(color: Colors.grey),
          MainIndexWidget(index: (this.indexes?.length??0)>1 ? indexes[1] : null, onTap: this.onTap),
          VerticalDivider(color: Colors.grey),
          MainIndexWidget(index: (this.indexes?.length??0)>2 ? indexes[2] : null, onTap: this.onTap),
        ],
      ),
    );
  }
}

class MainIndexWidget extends StatelessWidget {
  final ModelIndex index;
  final Function(ModelIndex) onTap;
  MainIndexWidget({Key key, this.index, this.onTap}): super(key:key);

  Color quoteColor() {
    return AppTheme.colors.price(this.index?.quote?.zde);
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){
        if(this.onTap != null){
          this.onTap(this.index);
        }
      },
      child: Container(
        width: 120.0,
        height: 70.0,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
                child: Text(
                  this.index?.zqmc??'--',
                  style: AppTheme.text.stockName,
                )
            ),
            Container(
                child: Text(
                  this.index?.quote?.strDqj??'--',
                  style: AppTheme.text.stockQuote.copyWith(color: this.quoteColor(), height: 1.2),
                )
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Text(
                        this.index?.quote?.strZde??'--',
                        textAlign: TextAlign.center,
                        style: AppTheme.text.stockQuoteSmall.copyWith(color: this.quoteColor(), height: 1.2),
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                        this.index?.quote?.strZdf??'--',
                        textAlign: TextAlign.center,
                        style: AppTheme.text.stockQuoteSmall.copyWith(color: this.quoteColor(), height: 1.2),
                      )
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
