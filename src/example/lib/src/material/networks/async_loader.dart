import 'package:flutter/material.dart';


class AsyncLoaderExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AsyncLoaderExampleState();
  }
}

class AsyncLoaderExampleState extends State<AsyncLoaderExample> {
  int _tabIndex = 0;

  static final List<String> _imageUrls = [
    'http://attimg.dospy.com/img/day_091026/20091026_923f4ba80ea904d327daVyCBNVvKcye2.png',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4190338744,3650952443&fm=26&gp=0.jpg',
    'http://s2.51offer.com/xinxi/uploadfile/2015/1113/20151113104920835.jpg'
  ];

  List<Widget> tabs = [
    ImageWidget(index: 0, url:_imageUrls[0],),
    ImageWidget(index: 1, url:_imageUrls[1],),
    ImageWidget(index: 2, url:_imageUrls[2],),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          onPressed: ()=>Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text('stack example'),
      ),
      body: tabs[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.print),
              title: Text('tab1')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('tab2')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.store),
              title: Text('tab3')
          )
        ],
        onTap: (index) {
          setState((){
            _tabIndex = index;
          });
        },
        currentIndex: _tabIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class ImageWidget extends StatefulWidget {
  int index;
  String url;
  ImageWidget({Key key, @required this.index, @required this.url}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ImageWidgetState();
  }
}


class ImageWidgetState extends State<ImageWidget> {
  Status _status;

  @override
  void initState() {
    super.initState();
    print('init state: ${widget.index}');
  }

  @override
  void deactivate() {
    print('deactivate: ${widget.index}');
    super.deactivate();
  }

  @override
  void reassemble() {
    print('reassemble: ${widget.index}');
    super.reassemble();
  }

  @override
  void dispose() {
    print('dispose: ${widget.index}');
    super.dispose();
  }

  void onLoad() async{
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return AsyncLoader(
      onLoad: this.onLoad,
      loaded: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(widget.index.toString()),
            ),
            Container(
              child: Image.network(widget.url),
            )
          ],
        ),
      ),
    );
  }
}

enum Status{loading, loaded, failed}


class AsyncLoader extends StatefulWidget {
  final Function onLoad;

  final Widget loading;
  final Widget loaded;
  final Widget failed;

  AsyncLoader({Key key, @required this.onLoad, this.loading, @required this.loaded, this.failed}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return AsyncLoaderState();
  }
}

class AsyncLoaderState extends State<AsyncLoader> {
  Status _status;

  @override
  void initState() {
    super.initState();
    this.onLoad();
  }

  void onLoad() async {
    setState(() {
      _status = Status.loading;
    });
    await widget.onLoad();
    Future.delayed(Duration(seconds: 3)).then((value){
      setState(() {
        _status = Status.loaded;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(_status) {
      case Status.loading:
        return widget.loading??LoadingIndicatorWidget();
      case Status.failed:
        return widget.failed??FailedIndicatorWidget(onLoad: this.onLoad,);
      case Status.loaded:
        return widget.loaded;
    }
  }
}


class LoadingIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 500),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


class LoadedIndicatorWidget extends StatelessWidget {
  final Widget child;
  LoadedIndicatorWidget({Key key, @required this.child}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 800),
      child: this.child,
    );
  }
}


class FailedIndicatorWidget extends StatelessWidget {
  final String error;
  final Function onLoad;

  FailedIndicatorWidget({Key key, this.error, this.onLoad}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 800),
      child: FlatButton(
        child: Center(
          child: this.error!=null ? this.error : Text('加载失败，点击屏幕重试'),
        ),
        onPressed: (){
          if(this.onLoad != null)
            this.onLoad();
        },
      ),
    );
  }
}
