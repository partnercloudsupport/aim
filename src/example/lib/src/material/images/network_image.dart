import 'dart:ui';
import 'package:flutter/material.dart';
import '../../scaffold_page.dart';


class NetWorkImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScaffoldPageWidget(
      title: 'network image',
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Image.network(
                'http://a.hiphotos.baidu.com/image/pic/item/2fdda3cc7cd98d10e915bca62c3fb80e7aec9060.jpg',
                width: 300,
                height: 300,
                color: Colors.green,
                colorBlendMode: BlendMode.lighten,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547701224859&di=7201c94893c2f72cb4e21d667da6e688&imgtype=0&src=http%3A%2F%2Fs9.rr.itc.cn%2Fr%2FwapChange%2F20173_7_18%2Fa1h59g3470867073619.gif',
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547701224859&di=7201c94893c2f72cb4e21d667da6e688&imgtype=0&src=http%3A%2F%2Fs9.rr.itc.cn%2Fr%2FwapChange%2F20173_7_18%2Fa1h59g3470867073619.gif',
                width: 250,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      )
    );
  }
}


