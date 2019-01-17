import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../scaffold_page.dart';

class CachedNetWorkImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
        title: 'cached network image',
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: CachedNetworkImage(
                  width: 300,
                  height: 200,
                  imageUrl: 'http://a.hiphotos.baidu.com/image/pic/item/2fdda3cc7cd98d10e915bca62c3fb80e7aec9060.jpg',
                  placeholder: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ));
  }
}
