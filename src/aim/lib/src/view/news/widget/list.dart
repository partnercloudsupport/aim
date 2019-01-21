import 'package:flutter/material.dart';

import '../../../models.dart';
import '../../../remotes.dart';

import '../../widget/pager.dart';
import 'item.dart';


// news list
class NewsListWidget extends StatelessWidget {
  final ModelNewsCategory category;
  NewsListWidget({Key key, @required this.category}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagingLoadController(
      rpc: RpcGetNewsItems,
      params: {'category':category.code},
      itemBuilder: (context, item){
        return NewsItemWidget(item: item);
      },
    );
  }
}
