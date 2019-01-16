import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../redux/state.dart';
import '../../../redux/action.dart';
import '../../theme.dart';
import '../../../model/index.dart';


class MainIndexesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainIndexesWidgetState();
  }
}

class MainIndexesWidgetState extends State<MainIndexesWidget> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer){
      print('udpate');
      StoreProvider.of<AppState>(context).dispatch(ActionUpdateMainIndexesQuote());
    });
  }

  @override
  void deactivate() {
    if(_timer != null){
      _timer.cancel();
      _timer = null;
    }
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ModelIndexes>(
      converter: (store) {
        return store.state.indexes.mainIndexesState.indexes;
      },
      builder: (context, indexes) {
        return Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        child: Card(
          elevation: 3.0,
          margin: EdgeInsets.only(top:5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: IndexQuoteWidget(index: indexes?.get(0)),
              ),
              Expanded(
                flex: 1,
                child: IndexQuoteWidget(index: indexes?.get(1)),
              ),
              Expanded(
                flex: 1,
                child: IndexQuoteWidget(index: indexes?.get(2)),
              )
            ],
          ),
        )
        );
      }
    );
  }
}


class IndexQuoteWidget extends StatelessWidget {
  final ModelIndex index;
  IndexQuoteWidget({Key key, this.index}): super(key:key);

  Color quoteColor() {
    return AimTheme.colors.price(index!=null ? index.zde : null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 70.0,
      color: Colors.grey[100],
      margin: EdgeInsets.all(1.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  index!=null ? index.strZqmc : '--',
                  style: AimTheme.text.stockName,
                )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  index!=null ? index.strDqj : '--',
                  style: AimTheme.text.stockQuote.copyWith(color: this.quoteColor()),
                )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            index!=null ? index.strZde : '--',
                            style: AimTheme.text.stockQuoteSmall.copyWith(color: this.quoteColor()),
                          )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            index!=null ? index.strZdf : '--',
                            style: AimTheme.text.stockQuoteSmall.copyWith(color: this.quoteColor()),
                          )
                        ),
                      )
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}