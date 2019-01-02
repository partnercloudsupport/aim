import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'scaffold_page.dart';

class HttpLoaderWidget extends StatefulWidget {
  final String url;
  HttpLoaderWidget({Key key, @required this.url}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HttpLoaderWidgetState();
  }
}

enum Status {loading, loaded, failed}

class HttpLoaderWidgetState extends State<HttpLoaderWidget> {
  Status _status = Status.loading;
  Dio _dio = Dio(
      Options(
      //baseUrl: 'http://192.168.10.239:9002',
      baseUrl: 'http://10.0.0.2:9004',
      connectTimeout: 5000,
      receiveTimeout: 10000,
    )
  );

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    setState(() {
      _status = Status.loading;
    });

    _dio.get('/news/categories').then((value){
      setState(() {
        _status = Status.loaded;
      });

    }).catchError((error){
      setState(() {
        _status = Status.failed;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_status) {
      case Status.loading:
        return ScaffoldPageWidget(
          title: 'http loader',
          child: Center(child: CircularProgressIndicator(),)
        );
      case Status.loaded:
        return ScaffoldPageWidget(
          title: 'http loader',
          child:Center(child: Text('loaded'),)
        );
      case Status.failed:
        return ScaffoldPageWidget(
          title: 'http loader',
          child: Container(
            alignment: Alignment.center,
            child: Column(
             children: <Widget>[
               Expanded(
                 flex: 1,
                 child: Container(
                   alignment: Alignment.bottomCenter,
                   child: Text('failed'),
                 )
               ),
               Expanded(
                 flex: 1,
                 child: Container(
                   alignment: Alignment.topCenter,
                   child: RaisedButton(
                     child: Text('retry'),
                     onPressed: (){
                       _load();
                     },
                   ),
                 )
               )
             ],
            ),
          )
        );
      default:
        break;
    }
  }
}
