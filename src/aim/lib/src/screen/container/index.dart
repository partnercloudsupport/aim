import 'package:flutter/material.dart';
import 'app.dart';

import '../widget/index.dart';
import '../../model/index.dart';
import '../../state/market.dart';
import '../../action/index.dart';

class MainIndexesContainer extends StatelessWidget {
  final Function(ModelIndex) onTap;
  MainIndexesContainer({Key key, @required this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataContainer<MarketIndexes>(
      action: ActionGetIndexes(),
      select: (state) => state.market?.indexes,
      builder: (context, model) {
        return MainIndexesWidget(
          indexes: model?.take(3),
          onTap: this.onTap,
        );
      },
    );
  }
}

class IndexDetailContainer extends StatelessWidget {
  // stock id
  final String id;
  IndexDetailContainer({Key key, @required this.id}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataContainer<MarketIndexDetail>(
      action: ActionGetIndexDetail(id: this.id),
      select: (state) => state.market?.index,
      builder: (context, model) {
        return IndexDetailWidget(
          index: model?.index,
        );
      },
    );
  }
}
