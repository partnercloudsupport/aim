import 'package:flutter/material.dart';


class StackExample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StackExample1State();
  }
}

class StackExample1State extends State<StackExample1> {
  int _tabIndex = 0;

  List<String> _imageUrls = [
    'http://attimg.dospy.com/img/day_091026/20091026_923f4ba80ea904d327daVyCBNVvKcye2.png',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4190338744,3650952443&fm=26&gp=0.jpg',
    'http://s2.51offer.com/xinxi/uploadfile/2015/1113/20151113104920835.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      body: Stack(
        fit: StackFit.loose,
        alignment: AlignmentDirectional.topStart,
        overflow: Overflow.clip,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Offstage(
            offstage: _tabIndex!=0,
            child: ImageWidget(index:0, url: _imageUrls[0]),
          ),
          Offstage(
            offstage: _tabIndex!=1,
            child: ImageWidget(index:1, url: _imageUrls[1]),
          ),
          Offstage(
            offstage: _tabIndex!=2,
            child: ImageWidget(index:2, url: _imageUrls[2]),
          ),
        ],
      ),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(widget.url),
    );
  }
}